// ignore_for_file: prefer_const_constructors
import 'package:flooz_challenge/create_passcode/models/passcode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const validPasscode = '132453';
  group('passcode', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final password = Passcode.pure();
        expect(password.value, '');
        expect(password.isPure, isTrue);
      });

      test('dirty creates correct instance', () {
        final password = Passcode.dirty(validPasscode);
        expect(password.value, validPasscode);
        expect(password.isPure, isFalse);
      });
    });

    group('validator', () {
      test('returns invalid error when passcode is less than 6', () {
        expect(
          Passcode.dirty('`11243`').error,
          PasscodeValidationError.invalid,
        );
      });
      test('returns invalid error when passcode contains a non-digit', () {
        expect(
          Passcode.dirty('11243@').error,
          PasscodeValidationError.invalid,
        );
      });
      test('returns repeatedDigits error when passcode contains repeated digits', () {
        expect(
          Passcode.dirty('111234').error,
          PasscodeValidationError.repeatedDigits,
        );
      });test('returns sequentialDigits error when passcode contains a simple sequence', () {
        expect(
          Passcode.dirty('234567').error,
          PasscodeValidationError.sequentialDigits,
        );
      });

      test('is valid when passcode is valid', () {
        expect(
          Passcode.dirty(validPasscode).error,
          isNull,
        );
      });
    });
  });
}