import 'package:test/test.dart';
import 'package:vguard/src/validators/is_maximum_length.dart';
import 'package:vguard/src/validators/is_minimum_length.dart';

void main() {
  group('Test minimum length validator', () {
    test('Constructor with default error message', () {
      final validator = IsMinimumLength(minimumLength: 5);
      validator.validate('abc');
      expect(validator.errorMessage, equals('Invalid minimum length'));
    });

    test('Constructor with custom error message', () {
      final validator = IsMinimumLength(
        minimumLength: 5,
        errorMessage: 'Custom min length message',
      );
      expect(validator.errorMessage, equals('Custom min length message'));
    });

    test('Valid value', () {
      final validator = IsMinimumLength(minimumLength: 3);
      expect(validator.validate('123'), isTrue);
      expect(validator.validate('12345'), isTrue);
    });

    test('Invalid value', () {
      final validator = IsMinimumLength(minimumLength: 4);
      expect(validator.validate('abc'), isFalse);
    });
  });

  group('Test maximum length validator', () {
    test('Constructor with default error message', () {
      final validator = IsMaximumLength(maximumLength: 5);
      validator.validate('abcdef');
      expect(validator.errorMessage, equals('Invalid maximum length'));
    });

    test('Constructor with custom error message', () {
      final validator = IsMaximumLength(
        maximumLength: 5,
        errorMessage: 'Custom max length message',
      );
      expect(validator.errorMessage, equals('Custom max length message'));
    });

    test('Valid value', () {
      final validator = IsMaximumLength(maximumLength: 5);
      expect(validator.validate('123'), isTrue);
      expect(validator.validate('12345'), isTrue);
    });

    test('Invalid value', () {
      final validator = IsMaximumLength(maximumLength: 3);
      expect(validator.validate('1234'), isFalse);
    });
  });
}
