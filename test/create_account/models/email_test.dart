// ignore_for_file: prefer_const_constructors
import 'package:flooz_challenge/create_account/models/email.dart';
import 'package:flooz_challenge/create_account/models/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const emailString = 'dan@dan.com';
  group('email', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final email = Email.pure();
        expect(email.value, '');
        expect(email.isPure, isTrue);
      });

      test('dirty creates correct instance', () {
        final email = Email.dirty(emailString);
        expect(email.value, emailString);
        expect(email.isPure, isFalse);
      });
    });

    group('validator', () {
      test('returns invalid error when email does not contain @', () {
        expect(
          Email.dirty('d.com').error,
          EmailValidationError.invalid,
        );
      });
      test('returns invalid error when email does not contain .', () {
        expect(
          Email.dirty('d@gmailcom').error,
          EmailValidationError.invalid,
        );
      });

      test('is valid when email is valid', () {
        expect(
          Email.dirty(emailString).error,
          isNull,
        );
      });
    });
  });
}