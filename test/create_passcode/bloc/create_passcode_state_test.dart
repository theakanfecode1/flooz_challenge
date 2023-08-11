import 'package:flooz_challenge/create_passcode/bloc/create_passcode_state.dart';
import 'package:flooz_challenge/create_passcode/models/passcode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

void main() {
  const passcode = '132453';


  group('CreatePasscodeState', () {
    test('supports value comparisons', () {
      expect(const CreatePasscodeState(), const CreatePasscodeState());
    });

    test('returns object with updated passcode when passcode is passed', () {
      expect(
        const CreatePasscodeState().copyWith(passcode: const Passcode.dirty(passcode)),
        const CreatePasscodeState(passcode: Passcode.dirty(passcode)),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const CreatePasscodeState()
            .copyWith(status: FormzSubmissionStatus.inProgress),
        const CreatePasscodeState(status: FormzSubmissionStatus.inProgress),
      );
    });


    test('returns same object when no properties are passed', () {
      expect(const CreatePasscodeState().copyWith(), const CreatePasscodeState());
    });

  });
}