import { InjectRepository } from "@nestjs/typeorm";
import { QueryService, UpdateOneOptions } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import * as moment from "moment";
import { DeepPartial, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { PromotionProductEntity } from "./entities/promotion-product.entity";

@QueryService(PromotionProductEntity)
export class PromotionProductService extends TypeOrmQueryService<PromotionProductEntity> {
  constructor(@InjectRepository(PromotionProductEntity) repo: Repository<PromotionProductEntity>) {
    super(repo);
  }

  public findByIdWithRelations(id: Id): Promise<PromotionProductEntity> {
    return this.repo.findOne({ where: { id }, relations: { product: true } });
  }

  public findOneByProductIdAndPromotionId(productId: Id, promotionId: Id): Promise<PromotionProductEntity> {
    return this.repo.findOneBy({ productId, promotionId });
  }

  public async createOne(record: DeepPartial<PromotionProductEntity> & { promotionLengthInDays }): Promise<PromotionProductEntity> {
    const { promotionLengthInDays, ...entity } = record;
    const oldPromotion = await this.findOneByProductIdAndPromotionId(record.productId, record.promotionId);

    if (oldPromotion) {
      return this.updateOne(oldPromotion.id, promotionLengthInDays);
    }

    const expireAt = moment().add(promotionLengthInDays, "days");
    return super.createOne({ ...entity, expireAt });
  }

  public async updateOne(
    id: Id,
    update: DeepPartial<PromotionProductEntity> & { promotionLengthInDays },
    opts?: UpdateOneOptions<PromotionProductEntity>,
  ): Promise<PromotionProductEntity> {
    const { promotionLengthInDays } = update;
    const currentPromotion = await this.repo.findOneByOrFail({ id });

    const expireAt = currentPromotion.valid ? moment(currentPromotion.expireAt).add(promotionLengthInDays, "days") : moment().add(promotionLengthInDays, "days");
    return super.updateOne(id, { expireAt }, opts);
  }
}
