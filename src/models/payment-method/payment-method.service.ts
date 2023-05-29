import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { FileUpload } from "graphql-upload";
import { join } from "path";
import { DeepPartial, Repository } from "typeorm";
import { PAYMENT_METHOD_FOLDER } from "../media/media.constants";
import { MediaService } from "../media/media.service";
import { PaymentMethodEntity } from "./entities/payment-method.entity";

@Injectable()
export class PaymentMethodService extends TypeOrmQueryService<PaymentMethodEntity> {
  constructor(@InjectRepository(PaymentMethodEntity) repo: Repository<PaymentMethodEntity>, private readonly mediaService: MediaService) {
    super(repo);
  }

  public async createOneWithMedia(record: DeepPartial<PaymentMethodEntity>, file: FileUpload): Promise<PaymentMethodEntity> {
    const media = await this.mediaService.saveOneMedia({ file, path: join(PAYMENT_METHOD_FOLDER, record.code) });
    return super.createOne({ ...record, media });
  }
}
