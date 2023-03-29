import { registerEnumType } from "@nestjs/graphql";

export enum MediaType {
  image = "image",
  video = "video",
  raw = "raw",
}

registerEnumType(MediaType, {
  name: "MediaType",
});
