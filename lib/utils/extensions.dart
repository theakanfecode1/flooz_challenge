extension StringExtension on String {
  String? get isValidEmail {
    final emailRegExp = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    if (!emailRegExp.hasMatch(this)) {
      return 'Invalid email';
    }
    return null;
  }

  String? get isValidName {
    if (isEmpty) {
      return 'Name is required.';
    }
    if (length < 2) {
      return 'Name must be at least 2 characters long.';
    }
    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(this)) {
      return 'Name must contain only letters.';
    }
    return null;
  }

  String? isValidPassCode() {
    if (isEmpty) {
      return 'Passcode is required.';
    }
    if (length != 6) {
      return 'Passcode must be 6 digits long.';
    }
    if (!RegExp(r"^\d+$").hasMatch(this)) {
      return 'Passcode must contain only digits.';
    }

    // Check for repeated digits more than 2 times
    for (int i = 0; i < length - 2; i++) {
      if (this[i] == this[i + 1] && this[i] == this[i + 2]) {
        return 'Passcode cannot have repeating digits more than 2 times.';
      }
    }
    bool isSimpleSequence = true;
    for (int i = 0; i < length - 1; i++) {
      if (int.parse(this[i]) + 1 != int.parse(this[i + 1])) {
        isSimpleSequence = false;
        break;
      }
    }
    if (isSimpleSequence) {
      return 'Passcode cannot be a simple sequence.';
    }

    return null;
  }
}
