import { SetMetadata } from "@nestjs/common";

export const NO_CACHE = "noCache";

export const NoCache = () => SetMetadata(NO_CACHE, true);
