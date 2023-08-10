import 'package:formz/formz.dart';

enum PasscodeValidationError { invalid ,repeatedDigits, sequentialDigits, }

class Passcode extends FormzInput<String, PasscodeValidationError> {
  const Passcode.pure([super.value = '']) : super.pure();

  const Passcode.dirty([super.value = '']) : super.dirty();

  static final _passcodeRegex = RegExp(r"^\d{6,}$");
  @override
  PasscodeValidationError? validator(String value) {
    if (!_passcodeRegex.hasMatch(value)) {
      return PasscodeValidationError.invalid;
    }
    if (_hasRepeatingDigits(value)) {
      return PasscodeValidationError.repeatedDigits;
    }
    if (_hasSequence(value)) {
      return PasscodeValidationError.sequentialDigits;
    }
    return null;
  }

  static bool _hasRepeatingDigits(String value){
    for (int i = 0; i < value.length - 2; i++) {
      if (value[i] == value[i + 1] && value[i] == value[i + 2]) {
        return true;
      }
    }
    return false;
  }

  static bool _hasSequence(String value){
    bool isSimpleSequence = true;
    for (int i = 0; i < value.length - 1; i++) {
      if (int.parse(value[i]) + 1 != int.parse(value[i + 1])) {
        isSimpleSequence = false;
        break;
      }
    }
    return isSimpleSequence;
  }
}
