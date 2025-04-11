import 'package:vguard/src/validators/validator_base.dart';

class IsMaximumLength extends ValidatorBase {
  int maximumLength;
  IsMaximumLength({required this.maximumLength, super.errorMessage});

  @override
  bool validate(value) {
    if (value.toString().length <= maximumLength) {
      return true;
    }

    errorMessage ??= 'Invalid maximum length';
    return false;
  }
}
