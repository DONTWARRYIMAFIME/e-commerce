import { Request, Response } from "express";
import { CachedUser } from "../../providers/security/auth/types/token-payload.interface";

export interface Context {
  req: Request & { user: CachedUser };
  res: Response;
}
