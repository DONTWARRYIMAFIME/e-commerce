import { Injectable } from "@nestjs/common";
import { EventEmitter2 } from "@nestjs/event-emitter";
import { ApolloError } from "apollo-server-express";
import { verify } from "argon2";
import { Response } from "express";
import { Actions } from "nest-casl";
import { UserEntity } from "../../../models/user/entities/user.entity";
import { UserCreateEvent } from "../../../models/user/events/user-create.event";
import { UserService } from "../../../models/user/user.service";
import { Roles } from "../authorization/role/role.enum";
import { RoleService } from "../authorization/role/role.service";
import { CachedUser } from "../authorization/types/request-user.interface";
import { AuthenticationCookieService } from "./cookie.service";
import { SignupInput } from "./dto/request/signup.input";
import { AccessTokenResponse } from "./dto/response/access-token.response";
import { LoginResponse } from "./dto/response/login.response";
import { LogoutResponse } from "./dto/response/logout.response";
import { SignupResponse } from "./dto/response/signup.response";
import { JwtService } from "./jwt.service";

@Injectable()
export class AuthenticationService {
  constructor(
    private readonly userService: UserService,
    private readonly roleService: RoleService,
    private readonly jwtService: JwtService,
    private readonly cookieService: AuthenticationCookieService,
    private readonly eventEmitter: EventEmitter2,
  ) {}

  public async validateUserByEmail(email: string, password: string): Promise<UserEntity> {
    const user = await this.userService.findOneByEmail(email);
    return this.validateUser(user, password);
  }

  public async validateUser(user: UserEntity, password: string): Promise<UserEntity> {
    if (!user) {
      return null;
    }

    // validate the password
    const passwordIsValid = await verify(user.password, password);

    if (!passwordIsValid) {
      return null;
    }

    return user;
  }

  public async login(user: UserEntity, res: Response): Promise<LoginResponse> {
    const payload = { id: user.id, roles: user.roles.map(role => role.name) };

    // Create tokens
    const accessToken = this.jwtService.createAccessToken(payload);
    const refreshToken = this.jwtService.createRefreshToken(payload);

    // Send refresh token in cookies
    this.cookieService.sendRefreshToken(refreshToken, res);
    return {
      user,
      accessToken,
      refreshToken,
    };
  }

  public async signupAsCustomer(userInput: SignupInput, res: Response): Promise<SignupResponse> {
    return this.signup(userInput, res, [Roles.customer]);
  }

  public async signupAsPartner(userInput: SignupInput, res: Response): Promise<SignupResponse> {
    return this.signup(userInput, res, [Roles.partner]);
  }

  private async signup(userInput: SignupInput, res: Response, roles: Roles[]): Promise<SignupResponse> {
    const user = await this.userService.findOneByEmail(userInput.email);

    if (user) {
      throw new ApolloError("User already exists", "404");
    }

    const roleEntities = await this.roleService.findManyByNames(roles);
    const createdUser = await this.userService.createOne({
      ...userInput,
      emailAddress: {
        address: userInput.email,
        name: `${userInput.firstName} ${userInput.lastName}`,
      },
      roles: roleEntities,
    });

    // Emit an event to notify all listeners that User was registered
    this.eventEmitter.emit(JSON.stringify({ subject: UserEntity.name, action: Actions.create }), new UserCreateEvent(createdUser));
    return this.login(createdUser, res);
  }

  public async reissueAccessToken(user: CachedUser): Promise<AccessTokenResponse> {
    return { accessToken: this.jwtService.createAccessToken(user) };
  }

  public async logout(res: Response): Promise<LogoutResponse> {
    this.cookieService.clearCookies(res);
    return { status: "success" };
  }
}
