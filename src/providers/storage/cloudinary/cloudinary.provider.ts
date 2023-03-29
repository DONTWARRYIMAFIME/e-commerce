import { v2 } from "cloudinary";
import { CloudinaryConfigService } from "../../../config/storage/cloudinary/cloudinary.service";
import { CLOUDINARY } from "./cloudinary.constants";

export const CloudinaryProvider = {
  provide: CLOUDINARY,
  inject: [CloudinaryConfigService],
  useFactory: async (cloudinaryConfigService: CloudinaryConfigService) => {
    return v2.config({
      cloud_name: cloudinaryConfigService.cloudName,
      api_key: cloudinaryConfigService.apiKey,
      api_secret: cloudinaryConfigService.apiSecret,
    });
  },
};
