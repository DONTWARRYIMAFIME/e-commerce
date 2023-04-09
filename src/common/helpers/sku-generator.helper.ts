import * as randomstring from "randomstring";
import { cutStringLength, filterLetters, removeVowels } from "./string.helper";

const convertCategoryCode = (categoryCode: string): string => {
  return cutStringLength(removeVowels(categoryCode).toUpperCase(), 2);
};

const convertBrandCode = (brandCode: string): string => {
  return cutStringLength(filterLetters(brandCode).toUpperCase(), 2);
};

const convertColorCode = (colorCode: string): string => {
  return cutStringLength(colorCode.toUpperCase(), 1);
};

const convertSizeCode = (sizeCode: string): string => {
  return sizeCode.toUpperCase();
};

export const generateSku = (categoryCode: string, brandCode: string, colorCode: string, sizeCode: string): string => {
  // SK-BE124214/R/XL
  return (
    convertCategoryCode(categoryCode) +
    "-" +
    convertBrandCode(brandCode) +
    randomstring.generate({ charset: "hex", capitalization: "uppercase", length: 8, readable: true }) +
    "/" +
    convertColorCode(colorCode) +
    "/" +
    convertSizeCode(sizeCode)
  );
};
