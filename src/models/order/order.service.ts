import { QueryService, UpdateOneOptions } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { UserInputError } from "apollo-server-core";
import { groupBy, map, sumBy } from "lodash";
import { DeepPartial, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { CartItemEntity } from "../cart-item/entities/cart-item.entity";
import { CartService } from "../cart/cart.service";
import { DeliveryMethodService } from "../delivery-method/delivery-method.service";
import { OrderItemEntity } from "../order-item/entities/order-item.entity";
import { OrderItemService } from "../order-item/order-item.service";
import { PaymentMethodService } from "../payment-method/payment-method.service";
import { PriceEntity } from "../price/entities/price.entity";
import { ProductVariantService } from "../product-variant/product-variant.service";
import { WarehouseItemService } from "../warehouse-item/warehouse-item.service";
import { OrderHistoryEntity } from "./entities/order-history.entity";
import { OrderEntity } from "./entities/order.entity";
import { OrderStatus } from "./enums/order-status.enum";

@QueryService(OrderEntity)
export class OrderService extends TypeOrmQueryService<OrderEntity> {
  constructor(
    @InjectRepository(OrderEntity) repo: Repository<OrderEntity>,
    @InjectRepository(OrderHistoryEntity)
    private readonly orderHistoryRepository: Repository<OrderHistoryEntity>,
    private readonly cartService: CartService,
    private readonly paymentMethodService: PaymentMethodService,
    private readonly deliveryMethodService: DeliveryMethodService,
    private readonly warehouseItemService: WarehouseItemService,
    private readonly orderItemService: OrderItemService,
    private readonly productVariantService: ProductVariantService,
  ) {
    super(repo);
  }

  public findById(id: Id): Promise<OrderEntity | undefined> {
    return this.repo.findOneBy({ id });
  }

  public createOne(record: DeepPartial<OrderEntity>): Promise<OrderEntity> {
    return super.createOne({ ...record, orderHistories: [{ status: OrderStatus.CREATED }] });
  }

  public async updateOne(id: Id, update: DeepPartial<OrderEntity>, opts?: UpdateOneOptions<OrderEntity>): Promise<OrderEntity> {
    if (update.status) {
      const orderHistories = await this.orderHistoryRepository.findBy({ orderId: id });
      return super.updateOne(id, { ...update, orderHistories: [...orderHistories, { status: update.status }] }, opts);
    }

    return super.updateOne(id, update, opts);
  }

  public async placeOrderFromUserCart(userId: Id): Promise<OrderEntity[]> {
    const { id: cartId, deliveryAddressId, deliveryPrice, deliveryMethodId, paymentMethodId, cartItems, quantity } = await this.cartService.findOneByUserId(userId);

    if (quantity <= 0) {
      throw new UserInputError("Cannot create an empty order");
    }

    // Split order
    const groupedCartItems = groupBy(cartItems, cartItems => cartItems.productVariant.product.brandId);

    return Promise.all(
      Object.values(groupedCartItems).map(async items => {
        const sPrice: DeepPartial<PriceEntity> = { amount: sumBy(items, item => item.price.amount) };
        const tPrice: DeepPartial<PriceEntity> = { amount: sPrice.amount * 0.2 };
        const dPrice: DeepPartial<PriceEntity> = { amount: deliveryPrice.amount };
        const totalPrice: DeepPartial<PriceEntity> = { amount: sPrice.amount + tPrice.amount + dPrice.amount };

        let order = await this.createOne({
          userId,
          paymentMethodId,
          deliveryMethodId,
          deliveryAddressId,
          subtotalPrice: sPrice,
          taxPrice: tPrice,
          deliveryPrice: dPrice,
          totalPrice,
        });

        // Validation to make sure that product available stock doesn't change
        const outOfStockItems = await this.checkStock(cartItems);

        if (outOfStockItems.length > 0) {
          await this.cartService.removeCartItemsFromCart(cartId, outOfStockItems);
          await this.updateOne(order.id, { status: OrderStatus.REJECTED });
          throw new UserInputError(`Not enough available products. Stock changes for products: [${map(outOfStockItems, "sku").join(", ")}]`);
        }

        // Reserve products after validation
        order = await this.reserveProducts(order, items);

        // For online payments return order with WAITING_FOR_PAYMENT status. This type requires extra steps
        const paymentMethod = await this.paymentMethodService.findById(paymentMethodId);

        if (paymentMethod.online) {
          order = await this.updateOne(order.id, { status: OrderStatus.WAITING_FOR_PAYMENT });
        } else {
          order = await this.updateOne(order.id, { status: OrderStatus.READY_FOR_SHIPPING });
        }

        // Clear cart, reset address, delivery method and payment method
        await this.cartService.resetCart(cartId);
        return order;
      }),
    );
  }

  public async confirmPayment(paymentIntentId: Id): Promise<OrderEntity[]> {
    const orders = await this.repo.findBy({ paymentIntentId });

    const confirmedOrders: OrderEntity[] = [];
    for (const order of orders) {
      await this.updateOne(order.id, { status: OrderStatus.PAID });
      const confirmedOrder = await this.updateOne(order.id, { status: OrderStatus.READY_FOR_SHIPPING });
      confirmedOrders.push(confirmedOrder);
    }

    return confirmedOrders;
  }

  public async transferOrderToShipping(orderId: Id): Promise<OrderEntity> {
    await this.orderItemService.releaseOrderItems(orderId);
    return this.updateOne(orderId, { status: OrderStatus.IN_SHIPPING });
  }

  public completeOrder(orderId: Id): Promise<OrderEntity> {
    return this.updateOne(orderId, { status: OrderStatus.COMPLETED });
  }

  public async cancelOrder(orderId: string): Promise<OrderEntity> {
    await this.orderItemService.cancelOrderItems(orderId);
    return this.updateOne(orderId, { status: OrderStatus.CANCELLED });
  }

  private async checkStock(cartItems): Promise<DeepPartial<OrderItemEntity>[]> {
    const outOfStockItems: DeepPartial<OrderItemEntity>[] = [];
    for (const cartItem of cartItems) {
      const { productVariantId, quantity } = cartItem;
      const productVariant = await this.productVariantService.findById(productVariantId);
      const sumAvailable = await this.warehouseItemService.countAvailable(productVariantId);

      if (quantity > sumAvailable) {
        outOfStockItems.push(productVariant);
      }
    }

    return outOfStockItems;
  }

  private async reserveProducts(order: OrderEntity, cartItems: CartItemEntity[]): Promise<OrderEntity> {
    const orderItems: DeepPartial<OrderItemEntity>[] = [];
    for (const cartItem of cartItems) {
      const { productVariantId, quantity } = cartItem;
      const productVariant = await this.productVariantService.findById(productVariantId);

      let toReserve = quantity;
      const warehouseItems = await this.warehouseItemService.findManyByProductVariantId(productVariantId);
      for (const warehouseItem of warehouseItems) {
        if (toReserve <= 0) {
          break;
        }

        // Actual amount of product that can be reserved from this warehouse
        const couldBeReserved = Math.min(warehouseItem.available, toReserve);

        // Do reservation
        await this.warehouseItemService.reserve(warehouseItem.warehouseId, warehouseItem.productVariantId, couldBeReserved);

        // Total price for reserved products
        const reservedProductsPrice: DeepPartial<PriceEntity> = { amount: productVariant.price.amount * couldBeReserved };

        // Update amount of product that should be reserved
        toReserve = toReserve - couldBeReserved;

        const orderItem: DeepPartial<OrderItemEntity> = {
          productVariantId,
          warehouseId: warehouseItem.warehouseId,
          price: reservedProductsPrice,
          quantity: couldBeReserved,
        };
        orderItems.push(orderItem);
      }
    }

    return this.updateOne(order.id, { orderItems, status: OrderStatus.RESERVED_IN_WAREHOUSE });
  }
}
