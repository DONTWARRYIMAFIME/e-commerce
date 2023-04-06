import { Injectable } from "@nestjs/common";
import { ImageFormat, UploadApiErrorResponse, UploadApiOptions, UploadApiResponse, v2, VideoFormat } from "cloudinary";
import { Readable } from "stream";

type UploadResponse = UploadApiResponse | UploadApiErrorResponse;

@Injectable()
export class CloudinaryService {
  public async uploadFiles(streams: Readable[], format: VideoFormat | ImageFormat, path: string): Promise<UploadResponse[]> {
    return Promise.all(streams.map(stream => this.uploadFile(stream, format, path)));
  }

  public async uploadFile(stream: Readable, format: VideoFormat | ImageFormat, path: string): Promise<UploadResponse> {
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

  public async removeFiles(publicIds: string[]): Promise<any> {
    return await Promise.all(publicIds.map(publicId => this.removeFile(publicId)));
  }

  public async removeFile(publicId: string): Promise<any> {
    return v2.uploader.destroy(publicId);
  }
}
