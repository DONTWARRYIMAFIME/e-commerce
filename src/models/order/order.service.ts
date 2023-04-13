import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { UserInputError } from "apollo-server-core";
import { omit } from "lodash";
import { DeepPartial, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { CartItemEntity } from "../cart-item/entities/cart-item.entity";
import { CartService } from "../cart/cart.service";
import { DeliveryMethodService } from "../delivery-method/delivery-method.service";
import { OrderItemEntity } from "../order-item/entities/order-item.entity";
import { OrderItemService } from "../order-item/order-item.service";
import { PriceEntity } from "../price/entities/price.entity";
import { ProductVariantService } from "../product-variant/product-variant.service";
import { WarehouseItemService } from "../warehouse-item/warehouse-item.service";
import { OrderEntity } from "./entities/order.entity";
import { OrderStatus } from "./enums/order-status.enum";

@QueryService(OrderEntity)
export class OrderService extends TypeOrmQueryService<OrderEntity> {
  constructor(
    @InjectRepository(OrderEntity) repo: Repository<OrderEntity>,
    private readonly cartService: CartService,
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

  /* Client place an order ->
   OrderService create order (with warehouse split logic) ->
   return order ->
   client send request for creating intent ->
   paymentService creates intent and updates order status to wait_for_payment ->
   return client secret -> client complete payment and send complete request to paymentService ->
   paymentService checks status and updates order status to in_shipping ->
   client redirects to thank message page
*/
  public async createOne(record: DeepPartial<OrderEntity>): Promise<OrderEntity> {
    const { userId, deliveryMethodId, deliveryAddressId, paymentMethodId } = record;
    const cart = await this.cartService.findOneByUserId(userId);

    if (cart.quantity <= 0) {
      throw new UserInputError("Cannot create an empty order");
    }

    const orderItems = await this.splitOrder(cart.id, cart.cartItems);

    // Subtotal price
    const subtotalPrice = omit(cart.price, "id");

    // Delivery price
    const deliveryMethod = await this.deliveryMethodService.findOneById(deliveryMethodId);
    const deliveryMethodPrice = omit(deliveryMethod.price, "id");

    // Tax
    // TODO: calculate tax amount
    const taxPrice = { amount: 0 };

    // Total price
    const totalPrice = { amount: subtotalPrice.amount + deliveryMethodPrice.amount };

    const order = super.createOne({
      userId,
      deliveryMethodId,
      deliveryAddressId,
      paymentMethodId,
      subtotalPrice: subtotalPrice,
      deliveryPrice: deliveryMethodPrice,
      taxPrice: taxPrice,
      totalPrice: totalPrice,
      orderItems,
    });

    await this.cartService.emptyCart(cart.id);
    return order;
  }

  public approveOrder(orderId: Id): Promise<OrderEntity> {
    return super.updateOne(orderId, { status: OrderStatus.WAITING_FOR_PAYMENT });
  }

  public async transferOrderToShipping(orderId: Id): Promise<OrderEntity> {
    await this.orderItemService.releaseOrderItems(orderId);
    return super.updateOne(orderId, { status: OrderStatus.IN_SHIPPING });
  }

  public completeOrder(orderId: Id): Promise<OrderEntity> {
    return super.updateOne(orderId, { status: OrderStatus.COMPLETED });
  }

  public async cancelOrder(orderId: string): Promise<OrderEntity> {
    await this.orderItemService.cancelOrderItems(orderId);
    return super.updateOne(orderId, { status: OrderStatus.CANCELLED });
  }

  private async splitOrder(cartId: Id, cartItems: CartItemEntity[]): Promise<DeepPartial<OrderItemEntity>[]> {
    const orderItems: DeepPartial<OrderItemEntity>[] = [];
    for (const cartItem of cartItems) {
      const { productVariantId, quantity, price } = cartItem;
      const productVariant = await this.productVariantService.findById(productVariantId);

      // console.log(productVariant.price.amount * quantity);
      // console.log(price.amount);
      // if (productVariant.price.amount * quantity !== price.amount) {
      //   await this.cartService.emptyCart(cartId);
      //   throw new UserInputError("Product's price have been changed. Your cart cleared");
      // }

      const sumAvailable = await this.warehouseItemService.countAvailable(productVariantId);

      // TODO: improve exception logic (return productVariantId which stock changed)
      if (quantity > sumAvailable) {
        await this.cartService.emptyCart(cartId);
        throw new UserInputError("Not enough available products. Your cart cleared");
      }

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
    return orderItems;
  }
}
