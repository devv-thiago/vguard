import 'package:vguard/src/validators/is_required.dart';
import 'package:test/test.dart';

void main() {
  group('Test is required validator', () {
    test('Construtor with no error message', () {
      IsrequiredValidator isRequired = IsrequiredValidator();
      isRequired.validate('');
      expect(isRequired.errorMessage, equals('The value can\'t be empty.'));
    });
    test('Construtor with error message', () {
      IsrequiredValidator isRequired =
          IsrequiredValidator(errorMessage: 'Custom message');
      expect(isRequired.errorMessage, equals('Custom message'));
    });
    test('Invalid value', () {
      IsrequiredValidator isRequired = IsrequiredValidator();
      expect(false, isRequired.validate(''));
      expect(false, isRequired.validate(' '));
      expect(false, isRequired.validate(null));
    });
    test('Valid value', () {
      IsrequiredValidator isRequired = IsrequiredValidator();
      expect(true, isRequired.validate('It is a valid value'));
    });
  });
}
