import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([super.value = '']) : super.pure();

  const Name.dirty([super.value = '']) : super.dirty();

  static final _nameRegex = RegExp(r"^(?!.*[\d\s\W_])\p{L}{2,}$", unicode: true);
  @override
  NameValidationError? validator(String value) {
    return _nameRegex.hasMatch(value)
        ? null
        : NameValidationError.invalid;
  }
}
