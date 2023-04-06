import { FileUpload } from "graphql-upload";
import { Id } from "../../../common/types/id.type";

export interface CreateOneMedia {
  file: FileUpload;
  path?: string;
}

export interface UpdateOneMedia {
  id: Id;
  file: FileUpload;
  path?: string;
}

export interface SaveOneMedia extends CreateOneMedia {
  id?: Id;
}
