import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreateOnePaymentMethodArgsType } from "./dto/create-payment-method.input";
import { PaymentMethodEntity } from "./entities/payment-method.entity";
import { PaymentMethodService } from "./payment-method.service";

@Resolver(() => PaymentMethodEntity)
export class PaymentMethodResolver {
  constructor(private readonly paymentMethodService: PaymentMethodService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.CREATE, PaymentMethodEntity)
  @Mutation(() => PaymentMethodEntity)
  public createOnePaymentMethod(
    @Args() args: CreateOnePaymentMethodArgsType,
    @Args("file", { type: () => GraphQLUpload, nullable: true }) file: FileUpload,
  ): Promise<PaymentMethodEntity> {
    const { input } = args.input;
    return file ? this.paymentMethodService.createOneWithMedia(input, file) : this.paymentMethodService.createOne(input);
  }
}
