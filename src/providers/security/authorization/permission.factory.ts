import { InferSubjects } from "@casl/ability";
import { Permissions } from "nest-casl";
import { EmailAddressConfirmationEntity } from "../../../models/email-address-confirmation/entities/email-address-confirmation.entity";
import { EmailAddressEntity } from "../../../models/email-address/entities/email-address.entity";
import { LanguageEntity } from "../../../models/language/entities/language.entity";
import { TranslationEntity } from "../../../models/translation/entities/translation.entity";
import { UserEntity } from "../../../models/user/entities/user.entity";
import { Actions } from "./action.enum";
import { RoleEntity } from "./role/entities/role.entity";
import { Roles } from "./role/role.enum";

// eslint-disable-next-line
export type Subjects = InferSubjects<typeof RoleEntity
  | typeof UserEntity
  | typeof EmailAddressEntity
  | typeof EmailAddressConfirmationEntity
  | typeof LanguageEntity
  | typeof TranslationEntity>;

export const permissions: Permissions<Roles, Subjects, Actions> = {
  everyone({ can }) {
    // Public permission
    can(Actions.READ, UserEntity);
  },

  [Roles.CUSTOMER]({ can }) {
    // Customer permission
  },

  [Roles.PARTNER]({ can }) {
    // Partner permission
  },

  [Roles.CUSTOMER_SUPPORT]({ can }) {
    // Customer support permission
    can(Actions.READ, UserEntity);
  },

  [Roles.ADMIN]({ can }) {
    // Admin permission
  },
};
