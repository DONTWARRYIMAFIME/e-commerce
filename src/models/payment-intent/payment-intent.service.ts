import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PaymentIntentEntity } from "./entities/payment-intent.entity";

@QueryService(PaymentIntentEntity)
export class PaymentIntentService extends TypeOrmQueryService<PaymentIntentEntity> {
  constructor(@InjectRepository(PaymentIntentEntity) repo: Repository<PaymentIntentEntity>) {
    super(repo);
  }
}
