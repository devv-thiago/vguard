import 'package:vguard/src/utils/validation_result.dart';
import 'package:vguard/src/validators/is_email.dart';
import 'package:vguard/src/validators/is_required.dart';
import 'package:vguard/src/validators/is_minimum_length.dart';
import 'package:vguard/src/validators/is_maximum_length.dart';
import 'package:vguard/src/validators/secure_password.dart';
import 'package:vguard/src/validators/validator_base.dart';

/// A class that allows chaining multiple validators to validate a given value.
class ValidationChain {
  final dynamic _value;
  final List<ValidatorBase> _validators = [];

  /// Creates a new instance of [ValidationChain] for the provided [_value].
  ValidationChain(this._value);

  /// Adds a validator to ensure the value is not null or empty.
  ///
  /// [errorMessage] is an optional custom message returned if validation fails.
  ValidationChain isRequired({String? errorMessage}) {
    _validators.add(IsrequiredValidator(errorMessage: errorMessage));
    return this;
  }

  /// Adds a validator to ensure the value is in a valid email format.
  ///
  /// Example of a valid email: `test@example.com`.
  ///
  /// [errorMessage] is an optional custom message returned if validation fails.
  ValidationChain isEmail({String? errorMessage}) {
    _validators.add(IsEmailValidator(errorMessage: errorMessage));
    return this;
  }

  /// Adds a validator to ensure the value has at least [min] characters.
  ///
  /// [errorMessage] is an optional custom message returned if validation fails.
  ValidationChain isMinimumLength(int min, {String? errorMessage}) {
    _validators
        .add(IsMinimumLength(minimumLength: min, errorMessage: errorMessage));
    return this;
  }

  /// Adds a validator to ensure the value has at most [max] characters.
  ///
  /// [errorMessage] is an optional custom message returned if validation fails.
  ValidationChain isMaximumLength(int max, {String? errorMessage}) {
    _validators
        .add(IsMaximumLength(maximumLength: max, errorMessage: errorMessage));
    return this;
  }

  /// Adds a validator to ensure the value meets secure password criteria.
  ///
  /// [highSecurityValidation] determines whether strict rules should be applied.
  /// [errorMessage] is an optional custom message returned if validation fails.
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

  /// Runs all chained validators against the value.
  ///
  /// Returns a [ValidationResult] containing a success flag and a list of error messages.
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
