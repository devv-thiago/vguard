import 'package:vguard/src/utils/extensions.dart';

void main() {
  final exampleString = "Example";
  exampleString.vguard.isEmail();
  exampleString.vguard.isMaximumLength(10);
  
}
