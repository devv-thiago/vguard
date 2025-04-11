import 'package:vguard/src/utils/extensions.dart';

void main() {
  final email = "user@example.com";
  final password = "MyP@ssw0rd!";

  final emailResult = email.vguard
      .isRequired(errorMessage: "Email is required")
      .isEmail(errorMessage: "Invalid email format")
      .run();

  final passwordResult = password.vguard
      .isRequired(errorMessage: "Password is required")
      .isMinimumLength(8,
          errorMessage: "Password must be at least 8 characters")
      .isSecurePassword(
          highSecurityValidation: false,
          errorMessage: "Password must contain letters, numbers, and symbols")
      .run();

  if (!emailResult.isValid) {
    print("Email error: ${emailResult.errors}");
  } else {
    print('Valid e-mail');
  }

  if (!passwordResult.isValid) {
    print("Password error: ${passwordResult.errors}");
  } else {
    print('Valid password');
  }
}
