import 'package:vguard/src/validators/validator_base.dart';

class IsrequiredValidator extends ValidatorBase {
  IsrequiredValidator({super.errorMessage});

  @override
  bool validate(value) {
    if (value == null || value.toString().trim().isEmpty || value == '') {
      errorMessage ??= 'The value can\'t be empty.';
      return false;
    }

    return true;
  }
}
