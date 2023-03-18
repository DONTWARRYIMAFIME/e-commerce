import * as fs from "fs";
import { extname } from "path";

export const scanDir = (path: string, extension: string): string[] => {
  return fs
    .readdirSync(path, { withFileTypes: true })
    .filter(item => !item.isDirectory() && extname(item.name) === extension)
    .map(item => item.name);
};
