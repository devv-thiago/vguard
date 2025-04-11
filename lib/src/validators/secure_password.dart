import 'package:vguard/src/utils/regex.dart';
import 'package:vguard/src/validators/validator_base.dart';

class IsSecurePassword extends ValidatorBase {
  bool highSecurityValidation = false;
  IsSecurePassword({required this.highSecurityValidation, super.errorMessage});

  @override
  bool validate(value) {
    if (highSecurityValidation) {
      if (AppRegex.superSecurePassword.hasMatch(value)) {
        return true;
      }
      errorMessage ??=
          'Password must be at least 8 characters long, contain at least one uppercase letter, one number, and one special character.';
      return false;
    } else {
      if (AppRegex.securePassword.hasMatch(value)) {
        return true;
      }
      errorMessage ??=
          'Password must be at least 12 characters long, contain at least one lowercase letter, one uppercase letter, one number, and one special character.';
      return false;
    }
  }
}
