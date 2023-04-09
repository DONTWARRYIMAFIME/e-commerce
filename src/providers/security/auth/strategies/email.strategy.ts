import { Injectable, UnauthorizedException } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { Strategy } from "passport-local";
import { UserEntity } from "../../../../models/user/entities/user.entity";
import { AuthenticationType } from "../auth.enum";
import { AuthService } from "../auth.service";

@Injectable()
export class EmailStrategy extends PassportStrategy(Strategy, AuthenticationType.EMAIL) {
  constructor(private readonly authService: AuthService) {
    // Define field name for local strategy. Default is username
    super({ usernameField: "email" });
  }

  public async validate(username: string, password: string): Promise<UserEntity> {
    const user = await this.authService.validateUserByEmail(username, password);

    if (!user) {
      throw new UnauthorizedException("Invalid email or password");
    }

    return user;
  }
}
