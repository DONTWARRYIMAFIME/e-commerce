import { ContextType } from "@nestjs/common";
import { Request, Response } from "express";

export interface Context {
  req: Request;
  res: Response;
}

export type GqlContextType = "graphql" | ContextType;
