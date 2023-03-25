import { InputType, PartialType } from "@nestjs/graphql";
import { CreateEmailAddressInput } from "./create-email-address.input";

@InputType()
export class UpdateEmailAddressInput extends PartialType(CreateEmailAddressInput) {}
