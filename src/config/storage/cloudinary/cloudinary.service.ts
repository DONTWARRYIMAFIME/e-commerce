import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { CLOUDINARY_API_KEY, CLOUDINARY_API_SECRET, CLOUDINARY_CLOUD_NAME } from "./cloudinary.constants";

@Injectable()
export class CloudinaryConfigService {
  constructor(private configService: ConfigService) {}

  get cloudName(): string {
    return this.configService.getOrThrow<string>(CLOUDINARY_CLOUD_NAME);
  }

  get apiKey(): string {
    return this.configService.getOrThrow<string>(CLOUDINARY_API_KEY);
  }

  get apiSecret(): string {
    return this.configService.getOrThrow<string>(CLOUDINARY_API_SECRET);
  }
}
