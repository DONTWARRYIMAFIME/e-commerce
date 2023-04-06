import { registerEnumType } from "@nestjs/graphql";

export enum MediaType {
  IMAGE = "IMAGE",
  VIDEO = "VIDEO",
  RAW = "RAW",
}

registerEnumType(MediaType, {
  name: "MediaType",
});
