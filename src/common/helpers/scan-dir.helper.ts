import * as fs from "fs";

export const scanDirNames = (path: string): string[] => {
  return fs
    .readdirSync(path, { withFileTypes: true })
    .filter(item => item.isDirectory())
    .map(item => item.name);
};
