import 'package:vguard/src/utils/regex.dart';
import 'package:vguard/src/validators/validator_base.dart';

class IsEmailValidator extends ValidatorBase {
  IsEmailValidator({super.errorMessage});

  @override
  bool validate(value) {
    if (AppRegex.emailRegex.hasMatch(value)) {
      return true;
    }

    errorMessage ??= 'Invalid e-mail format';
    return false;
  }
}
