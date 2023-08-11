import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_bloc.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_event.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_state.dart';
import 'package:flooz_challenge/create_passcode/view/create_passcode_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreatePasscodeBloc
    extends MockBloc<CreatePasscodeEvent, CreatePasscodeState>
    implements CreatePasscodeBloc {}

void main() {
  const continueButtonKey = Key('createPasscode_continue_appButton');
  const passcodeInputKey = Key('createPasscode_passcode_TextInput');

  group('CreatePasscodeForm', () {
    late CreatePasscodeBloc createPasscodeBloc;

    setUp(() {
      createPasscodeBloc = MockCreatePasscodeBloc();
      when(() => createPasscodeBloc.state)
          .thenReturn(const CreatePasscodeState());
    });

    group('adds', () {
      testWidgets('adds PasscodeChanged to CreatePasscodeBloc when passcode is updated',
          (tester) async {
        const passcode = '132453';
        await tester.pumpWidget(
          MaterialApp(
              home: Scaffold(
                  body: BlocProvider.value(
            value: createPasscodeBloc,
            child: const CreatePasscodeForm(),
          ))),
        );
        await tester.enterText(find.byKey(passcodeInputKey), passcode);
        verify(
          () => createPasscodeBloc.add(const PasscodeChanged(passcode: passcode)),
        ).called(1);
      });

      testWidgets(
          'adds FormSubmitted to CreatePasscodeBloc when form is '
          'submitted', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: createPasscodeBloc,
                child: const CreatePasscodeForm(),
              ),
            ),
          ),
        );
        await tester.tap(find.byKey(continueButtonKey));
        verify(
          () => createPasscodeBloc.add(const FormSubmitted()),
        ).called(1);
      });
    });
  });
}
