import { Injectable } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { Strategy } from "passport-local";
import { UserEntity } from "../../../../models/user/entities/user.entity";
import { AuthenticationType } from "../authentication.enum";
import { AuthenticationService } from "../authentication.service";

@Injectable()
export class EmailStrategy extends PassportStrategy(Strategy, AuthenticationType.EMAIL) {
  constructor(private readonly authService: AuthenticationService) {
    // Define field name for local strategy. Default is username
    super({ usernameField: "email" });
  }

  public async validate(username: string, password: string): Promise<UserEntity> {
    return this.authService.validateUserByEmail(username, password);
  }
}
