import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Query, Resolver } from "@nestjs/graphql";
import { Response } from "express";
import { UserEntity } from "../../../models/user/entities/user.entity";
import { UserService } from "../../../models/user/user.service";
import { NoCache } from "../../cache/redis/noCache.decorator";
import { AccessGuard } from "../casl/access.guard";
import { CaslUser } from "../casl/decorators/casl-user";
import { UserProxy } from "../casl/proxies/user.proxy";
import { AuthService } from "./auth.service";
import { IsPublic } from "./decorators/is-public.decorator";
import { Res } from "./decorators/res.decorator";
import { LoginInput } from "./dto/request/login.input";
import { SignupInput } from "./dto/request/signup.input";
import { AccessTokenResponse } from "./dto/response/access-token.response";
import { LoginResponse } from "./dto/response/login.response";
import { LogoutResponse } from "./dto/response/logout.response";
import { SignupResponse } from "./dto/response/signup.response";
import { EmailAuthGuard } from "./guards/email.guard";
import { RefreshTokenAuthGuard } from "./guards/refresh-token-auth.guard";
import { CachedUser } from "./types/token-payload.interface";

@Resolver()
export class AuthResolver {
  constructor(private readonly authService: AuthService, private readonly userService: UserService) {}

  @IsPublic()
  @UseGuards(EmailAuthGuard, AccessGuard)
  @Mutation(() => LoginResponse)
  public async login(@Args("input") input: LoginInput, @CaslUser() userProxy: UserProxy<UserEntity>, @Res() response: Response): Promise<LoginResponse> {
    const user = await userProxy.getFromHook();
    return this.authService.login(user, response);
  }

  @IsPublic()
  @Mutation(() => SignupResponse)
  public signup(@Args("input") input: SignupInput, @Res() response: Response): Promise<SignupResponse> {
    return this.authService.signupAsCustomer(input, response);
  }

  @UseGuards(RefreshTokenAuthGuard)
  @Mutation(() => AccessTokenResponse)
  public reissueAccessToken(@CaslUser() userProxy: UserProxy<CachedUser>): Promise<AccessTokenResponse> {
    const user = userProxy.getFromRequest();
    return this.authService.reissueAccessToken(user);
  }

  @NoCache()
  @Query(() => UserEntity, { name: "me", nullable: true })
  public async getLoggedInUser(@CaslUser() userProxy: UserProxy): Promise<UserEntity> {
    const user = userProxy.getFromRequest();
    return this.userService.findOneById(user.id);
  }

  @IsPublic()
  @Mutation(() => Boolean)
  public logout(@Res() response): Promise<LogoutResponse> {
    return this.authService.logout(response);
  }
}
