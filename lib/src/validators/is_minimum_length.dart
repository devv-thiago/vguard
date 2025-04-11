import 'package:vguard/src/validators/validator_base.dart';

class IsMinimumLength extends ValidatorBase {
  int minimumLength;
  IsMinimumLength({required this.minimumLength, super.errorMessage});

  @override
  bool validate(value) {
    if (value.toString().length >= minimumLength) {
      return true;
    }

    errorMessage ??= 'Invalid minimum length';
    return false;
  }
}
