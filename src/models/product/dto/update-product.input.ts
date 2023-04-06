import { MutationArgsType, RelationsInputType } from "@nestjs-query/query-graphql";
import { ArgsType, InputType, PartialType } from "@nestjs/graphql";
import { MediaEntity } from "../../media/entities/media.entity";
import { ProductEntity } from "../entities/product.entity";
import { CreateProductInput } from "./create-product.input";

@InputType()
export class UpdateProductInput extends PartialType(CreateProductInput) {}

@InputType()
export class RemoveMediaInputType extends RelationsInputType(ProductEntity, MediaEntity) {}

@ArgsType()
export class RemoveMediaArgsType extends MutationArgsType(RemoveMediaInputType) {}
