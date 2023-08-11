import 'package:flooz_challenge/create_account/bloc/create_account_state.dart';
import 'package:flooz_challenge/create_account/models/email.dart';
import 'package:flooz_challenge/create_account/models/name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

void main() {
  const email = 'dan@ogundiran.com';
  const name = 'Dan';

  group('CreateAccountState', () {
    test('supports value comparisons', () {
      expect(const CreateAccountState(), const CreateAccountState());
    });

    test('returns object with updated name when name is passed', () {
      expect(
        const CreateAccountState().copyWith(name: const Name.dirty(name)),
        const CreateAccountState(name: Name.dirty(name)),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const CreateAccountState()
            .copyWith(status: FormzSubmissionStatus.inProgress),
        const CreateAccountState(status: FormzSubmissionStatus.inProgress),
      );
    });


    test('returns same object when no properties are passed', () {
      expect(const CreateAccountState().copyWith(), const CreateAccountState());
    });



    test('returns object with updated email when email is passed', () {
      expect(
        const CreateAccountState().copyWith(email: const Email.dirty(email)),
        const CreateAccountState(email: Email.dirty(email)),
      );
    });

  });
}