import 'package:flooz_challenge/create_passcode/models/passcode.dart';

extension PasscodeExt on Passcode {
  String get getErrorMessage {
    switch (error) {
      case PasscodeValidationError.invalid:
        return 'Passcode must contain 6 digits only.';
      case PasscodeValidationError.repeatedDigits:
        return 'Passcode cannot have repeating digits more than 2 times.';
      case PasscodeValidationError.sequentialDigits:
        return 'Passcode cannot be a simple sequence.';
      case null:
        return 'Something went wrong';
    }
  }
}