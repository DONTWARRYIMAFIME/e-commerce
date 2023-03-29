import { Module } from "@nestjs/common";
import { CloudinaryConfigService } from "./cloudinary.service";

@Module({
  providers: [CloudinaryConfigService],
  exports: [CloudinaryConfigService],
})
export class CloudinaryConfigModule {}
