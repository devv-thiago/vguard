import 'package:test/test.dart';
import 'package:vguard/src/utils/extensions.dart';

void main() {
  group('ValidationChain', () {
    test('Should pass all validations', () {
      final result = 'test@email.com'
          .vguard
          .isRequired()
          .isEmail()
          .isMinimumLength(5)
          .run();

      expect(result.isValid, true);
      expect(result.errors, isEmpty);
    });

    test('Should fail required validation', () {
      final result = ''.vguard.isRequired().isEmail().isMinimumLength(5).run();

      expect(result.isValid, false);
      expect(result.errors, contains("The value can't be empty."));
    });

    test('Should fail email validation', () {
      final result =
          'not-an-email'.vguard.isRequired().isEmail().isMinimumLength(5).run();

      expect(result.isValid, false);
      expect(result.errors, contains('Invalid e-mail format'));
    });

    test('Should fail minimum length validation', () {
      final result =
          'abc@e'.vguard.isRequired().isEmail().isMinimumLength(10).run();

      expect(result.isValid, false);
      expect(result.errors, contains('Invalid minimum length'));
    });

    test('Should fail multiple validations', () {
      final result = ''.vguard.isRequired().isEmail().isMinimumLength(8).run();

      expect(result.isValid, false);
      expect(result.errors.length, greaterThan(1));
    });
  });
}
