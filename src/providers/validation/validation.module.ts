import { Module } from "@nestjs/common";
import { IsEmailNotExistsDecorator } from "./decorators/IsEmailNotExists.decorator";

@Module({
  // Define all validators that will use DI as provider
  providers: [IsEmailNotExistsDecorator],
  exports: [IsEmailNotExistsDecorator],
})
export class ValidationModule {}
