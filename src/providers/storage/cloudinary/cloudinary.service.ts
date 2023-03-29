import { Injectable } from "@nestjs/common";
import { ImageFormat, UploadApiErrorResponse, UploadApiOptions, UploadApiResponse, v2, VideoFormat } from "cloudinary";
import { Readable } from "stream";

@Injectable()
export class CloudinaryService {
  public async uploadFile(stream: Readable, format: VideoFormat | ImageFormat, path: string): Promise<UploadApiResponse | UploadApiErrorResponse> {
    const options: UploadApiOptions = {
      format,
      resource_type: "auto",
      folder: path,
      overwrite: true,
    };

    return new Promise((resolve, reject) => {
      const upload = v2.uploader.upload_stream(options, (error, result) => {
        if (error) {
          return reject(error);
        }
        resolve(result);
      });
      stream.pipe(upload);
    });
  }

  public async removeFile(publicId: string): Promise<any> {
    return v2.uploader.destroy(publicId);
  }
}
