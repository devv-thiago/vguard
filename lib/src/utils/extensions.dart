import 'package:vguard/vguard.dart';

extension VguardExtension on String {
  ValidationChain get vguard => ValidationChain(this);
}
