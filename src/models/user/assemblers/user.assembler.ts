import { Assembler, ClassTransformerAssembler } from "@nestjs-query/core";
import { UserEntity } from "../entities/user.entity";

@Assembler(UserEntity, UserEntity)
export class UserAssembler extends ClassTransformerAssembler<UserEntity, UserEntity> {
  // public convertToDTO(entity: UserEntity): UserEntity {
  //   console.log("entity", entity);
  //   const dto = super.convertToDTO(entity);
  //   console.log("dto", dto);
  //   dto.email = entity.emailAddressEntity?.address;
  //   dto.roles = entity.roleEntities?.map(role => role.name);
  //   return dto;
  // }

  public async convertAsyncToDTO(entity: Promise<UserEntity>): Promise<UserEntity> {
    console.log("HERE");
    const dto = await super.convertAsyncToDTO(entity);
    const loadedEntity = await entity;
    dto.email = loadedEntity.emailAddressEntity?.address;
    dto.roles = loadedEntity.roleEntities?.map(role => role.name);
    return dto;
  }
}
