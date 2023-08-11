// ignore_for_file: prefer_const_constructors
import 'package:flooz_challenge/create_account/models/name.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const nameString = 'name';
  group('name', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final name = Name.pure();
        expect(name.value, '');
        expect(name.isPure, isTrue);
      });

      test('dirty creates correct instance', () {
        final name = Name.dirty(nameString);
        expect(name.value, nameString);
        expect(name.isPure, isFalse);
      });
    });

    group('validator', () {
      test('returns invalid error when name is a single character', () {
        expect(
          Name.dirty('d').error,
          NameValidationError.invalid,
        );
      });
      test('returns invalid error when name contains a symbol', () {
        expect(
          Name.dirty('dd@').error,
          NameValidationError.invalid,
        );
      });
      test('returns invalid error when name contains space', () {
        expect(
          Name.dirty('d ').error,
          NameValidationError.invalid,
        );
      });

      test('is valid when name is valid', () {
        expect(
          Name.dirty(nameString).error,
          isNull,
        );
      });
    });
  });
}