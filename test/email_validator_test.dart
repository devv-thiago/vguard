import 'package:vguard/src/validators/is_email.dart';
import 'package:test/test.dart';

void main() {
  group('Test is email validator', () {
    test('Construtor with no error message', () {
      IsEmailValidator isEmail = IsEmailValidator();
      isEmail.validate('test@.com.br');
      expect(isEmail.errorMessage, equals('Invalid e-mail format'));
    });
    test('Construtor with error message', () {
      IsEmailValidator isEmail =
          IsEmailValidator(errorMessage: 'Custom message');
      expect(isEmail.errorMessage, equals('Custom message'));
    });
    test('Invalid value', () {
      IsEmailValidator isEmail = IsEmailValidator();
      expect(false, isEmail.validate('test'));
      expect(false, isEmail.validate('test@.com.br'));
      expect(false, isEmail.validate('test@gmail'));
    });
    test('Valid value', () {
      IsEmailValidator isEmail = IsEmailValidator();
      expect(true, isEmail.validate('test@gmail.com'));
    });
  });
}
