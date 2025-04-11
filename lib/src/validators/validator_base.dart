abstract class ValidatorBase {
  String? errorMessage;

  ValidatorBase({this.errorMessage});

  bool validate(var value);
}
