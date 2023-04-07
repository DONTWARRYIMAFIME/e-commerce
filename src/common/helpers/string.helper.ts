export const filterLetters = (value: string): string => {
  return value.replace(/[^a-zA-Z0-9]/g, "");
};

export const removeVowels = (value: string): string => {
  return value.replace(/[aeiouy]/gi, "");
};

export const cutStringLength = (value: string, length: number, fromBack = false): string => {
  return fromBack ? value.substring(value.length - 1 - length, length) : value.substring(0, length);
};
