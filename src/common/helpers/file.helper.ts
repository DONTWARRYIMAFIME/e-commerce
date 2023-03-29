import { extname as e } from "path";

export const extname = (path: string): string => {
  return e(path).replace(".", "");
};
