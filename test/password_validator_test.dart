import 'package:test/test.dart';
import 'package:vguard/src/validators/secure_password.dart';

void main() {
  group('Test secure password validator', () {
    test(
        'Constructor with default error message - high security (12+ characters)',
        () {
      final validator = IsSecurePassword(highSecurityValidation: false);
      validator.validate('weak');
      expect(
        validator.errorMessage,
        equals(
            'Password must be at least 12 characters long, contain at least one lowercase letter, one uppercase letter, one number, and one special character.'),
      );
    });

    test(
        'Constructor with default error message - standard security (8+ characters)',
        () {
      final validator = IsSecurePassword(highSecurityValidation: true);
      validator.validate('weak');
      expect(
        validator.errorMessage,
        equals(
            'Password must be at least 8 characters long, contain at least one uppercase letter, one number, and one special character.'),
      );
    });

    test('Constructor with custom error message', () {
      final validator = IsSecurePassword(
        highSecurityValidation: true,
        errorMessage: 'Custom password error',
      );
      expect(validator.errorMessage, equals('Custom password error'));
    });

    test('Valid strong password (standard security)', () {
      final validator = IsSecurePassword(highSecurityValidation: false);
      expect(validator.validate('Abcdef1!@'), isTrue);
    });

    test('Valid strong password (high security)', () {
      final validator = IsSecurePassword(highSecurityValidation: true);
      expect(validator.validate('Abcdefghijk1!'), isTrue);
    });

    test('Invalid password', () {
      final validator = IsSecurePassword(highSecurityValidation: true);
      expect(validator.validate('abc'), isFalse);
    });
  });
}
