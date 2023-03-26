import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Query, Resolver } from "@nestjs/graphql";
import { Response } from "express";
import { CaslUser, UserProxy } from "nest-casl";
import { UserEntity } from "../../../models/user/entities/user.entity";
import { AccessGuard } from "../authorization/guards/access.guard";
import { CachedUser } from "../authorization/types/request-user.interface";
import { AuthenticationService } from "./authentication.service";
import { IsPublic } from "./decorators/isPublic.decorator";
import { Res } from "./decorators/res.decorator";
import { LoginInput } from "./dto/request/login.input";
import { SignupInput } from "./dto/request/signup.input";
import { AccessTokenResponse } from "./dto/response/access-token.response";
import { LoginResponse } from "./dto/response/login.response";
import { LogoutResponse } from "./dto/response/logout.response";
import { SignupResponse } from "./dto/response/signup.response";
import { EmailAuthGuard } from "./guards/email.guard";
import { RefreshTokenAuthGuard } from "./guards/refresh-token-auth.guard";

@Resolver()
export class AuthenticationResolver {
  constructor(private readonly authService: AuthenticationService) {}

  @UseGuards(EmailAuthGuard, AccessGuard)
  @Mutation(() => LoginResponse)
  public async login(@Args("input") input: LoginInput, @CaslUser() userProxy: UserProxy<UserEntity>, @Res() response: Response): Promise<LoginResponse> {
    const user = await userProxy.getFromHook();
    return this.authService.login(user, response);
  }

  @IsPublic()
  @Mutation(() => SignupResponse)
  public signup(@Args("input") input: SignupInput, @Res() response: Response): Promise<SignupResponse> {
    return this.authService.signup(input, response);
  }

  @UseGuards(RefreshTokenAuthGuard)
  @Mutation(() => AccessTokenResponse)
  public reissueAccessToken(@CaslUser() userProxy: UserProxy<CachedUser>): Promise<AccessTokenResponse> {
    const user = userProxy.getFromRequest();
    return this.authService.reissueAccessToken(user);
  }

  @Query(() => UserEntity, { name: "me", nullable: true })
  public async getLoggedInUser(@CaslUser() userProxy: UserProxy<UserEntity>): Promise<UserEntity> {
    return userProxy.getFromHook();
  }

  @IsPublic()
  @Mutation(() => Boolean)
  public logout(@Res() response): Promise<LogoutResponse> {
    return this.authService.logout(response);
  }
}
