import { Injectable } from "@nestjs/common";
import { UploadApiErrorResponse, UploadApiOptions, UploadApiResponse, v2 } from "cloudinary";
import { extname } from "path";
import { Readable } from "stream";

@Injectable()
export class CloudinaryService {
  public async uploadFile(stream: Readable, filename: string, path: string): Promise<UploadApiResponse | UploadApiErrorResponse> {
    const options: UploadApiOptions = {
      format: extname(filename).replace(".", ""),
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

  public async removeFile(secureId: string): Promise<any> {
    return v2.uploader.destroy(secureId);
  }
}
