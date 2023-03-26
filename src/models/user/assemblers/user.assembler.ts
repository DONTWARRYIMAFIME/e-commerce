import { Assembler, ClassTransformerAssembler } from "@nestjs-query/core";
import { UserEntity } from "../entities/user.entity";

@Assembler(UserEntity, UserEntity)
export class UserAssembler extends ClassTransformerAssembler<UserEntity, UserEntity> {
  convertToDTO(entity: UserEntity): UserEntity {
    console.log("entity", entity);
    const dto = super.convertToDTO(entity);
    console.log("dto", dto);
    dto.email = entity.emailAddressEntity?.address;
    dto.roles = entity.roleEntities?.map(role => role.name);
    return dto;
  }
}
