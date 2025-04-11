import 'package:vguard/src/utils/validation_result.dart';
import 'package:vguard/src/validators/is_email.dart';
import 'package:vguard/src/validators/is_required.dart';
import 'package:vguard/src/validators/is_minimum_length.dart';
import 'package:vguard/src/validators/is_maximum_length.dart';
import 'package:vguard/src/validators/secure_password.dart';
import 'package:vguard/src/validators/validator_base.dart';

class ValidationChain {
  final dynamic _value;
  final List<ValidatorBase> _validators = [];

  ValidationChain(this._value);

  ValidationChain isRequired({String? errorMessage}) {
    _validators.add(IsrequiredValidator(errorMessage: errorMessage));
    return this;
  }

  ValidationChain isEmail({String? errorMessage}) {
    _validators.add(IsEmailValidator(errorMessage: errorMessage));
    return this;
  }

  ValidationChain isMinimumLength(int min, {String? errorMessage}) {
    _validators
        .add(IsMinimumLength(minimumLength: min, errorMessage: errorMessage));
    return this;
  }

  ValidationChain isMaximumLength(int max, {String? errorMessage}) {
    _validators
        .add(IsMaximumLength(maximumLength: max, errorMessage: errorMessage));
    return this;
  }

  ValidationChain isSecurePassword({
    required bool highSecurityValidation,
    String? errorMessage,
  }) {
    _validators.add(IsSecurePassword(
      highSecurityValidation: highSecurityValidation,
      errorMessage: errorMessage,
    ));
    return this;
  }

  ValidationResult run() {
    List<String> errors = [];
    for (var validator in _validators) {
      if (!validator.validate(_value)) {
        errors.add(validator.errorMessage ?? 'Unknown error');
      }
    }

    return ValidationResult(errors.isEmpty, errors);
  }
}
