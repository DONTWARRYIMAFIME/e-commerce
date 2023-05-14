import { Injectable } from "@nestjs/common";
import { EventEmitter2 } from "@nestjs/event-emitter";
import { verify } from "argon2";
import { Response } from "express";
import { Roles } from "../../../models/role/enums/roles.enum";
import { RoleService } from "../../../models/role/role.service";
import { UserEntity } from "../../../models/user/entities/user.entity";
import { UserCreateEvent } from "../../../models/user/events/user-create.event";
import { UserService } from "../../../models/user/user.service";
import { Actions } from "../casl/actions.enum";
import { AuthCookieService } from "./auth-cookie.service";
import { SignupInput } from "./dto/request/signup.input";
import { AccessTokenResponse } from "./dto/response/access-token.response";
import { LoginResponse } from "./dto/response/login.response";
import { SignupResponse } from "./dto/response/signup.response";
import { JwtService } from "./jwt.service";
import { CachedUser } from "./types/token-payload.interface";

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService,
    private readonly roleService: RoleService,
    private readonly jwtService: JwtService,
    private readonly cookieService: AuthCookieService,
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
    const payload = {
      id: user.id,
      permissions: user.permissions,
    };

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
    return this.signup(userInput, res, [Roles.CUSTOMER]);
  }

  public async signupAsPartner(userInput: SignupInput, res: Response): Promise<SignupResponse> {
    return this.signup(userInput, res, [Roles.CUSTOMER, Roles.PARTNER]);
  }

  private async signup(userInput: SignupInput, res: Response, roles: Roles[]): Promise<SignupResponse> {
    const roleEntities = await this.roleService.findManyByCodes(roles);
    const createdUser = await this.userService.createOne({
      ...userInput,
      emailAddress: {
        address: userInput.email,
        name: `${userInput.firstName} ${userInput.lastName}`,
      },
      roles: roleEntities,
    });

    // Emit an event to notify all listeners that User was registered
    this.eventEmitter.emit(JSON.stringify({ subject: UserEntity.name, action: Actions.CREATE }), new UserCreateEvent(createdUser));
    return this.login(createdUser, res);
  }

  public async reissueAccessToken(user: CachedUser): Promise<AccessTokenResponse> {
    return { accessToken: this.jwtService.createAccessToken(user) };
  }

  public async logout(res: Response): Promise<boolean> {
    this.cookieService.clearCookies(res);
    return true;
  }
}
