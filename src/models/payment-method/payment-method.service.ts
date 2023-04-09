import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PaymentMethodEntity } from "./entities/payment-method.entity";

@Injectable()
export class PaymentMethodService extends TypeOrmQueryService<PaymentMethodEntity> {
  constructor(@InjectRepository(PaymentMethodEntity) repo: Repository<PaymentMethodEntity>) {
    super(repo);
  }
}
