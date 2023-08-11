import 'package:flooz_challenge/create_passcode/bloc/create_passcode_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const passcode = '132453';


  group('CreatePasscodeEvent', () {
    group('PasscodeChanged', () {
      test('supports value comparisons', () {
        expect(
          const PasscodeChanged(passcode: passcode),
          const PasscodeChanged(passcode: passcode),
        );
      });
    });


    group('FormSubmitted', () {
      test('supports value comparisons', () {
        expect(
            const FormSubmitted(), const FormSubmitted()
        );
      });
    });
  });
}
