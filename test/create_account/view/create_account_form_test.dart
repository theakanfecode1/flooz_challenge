import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_bloc.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_event.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_state.dart';
import 'package:flooz_challenge/create_account/view/create_account_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateAccountBloc
    extends MockBloc<CreateAccountEvent, CreateAccountState>
    implements CreateAccountBloc {}

void main() {
  const nextButtonKey = Key('createAccount_continue_appButton');
  const nameInputKey = Key('createAccount_name_textField');
  const emailInputKey = Key('createAccount_email_textField');

  group('CreateAccountForm', () {
    late CreateAccountBloc createAccountBloc;

    setUp(() {
      createAccountBloc = MockCreateAccountBloc();
      when(() => createAccountBloc.state)
          .thenReturn(const CreateAccountState());
    });

    group('adds', () {
      testWidgets('adds NameChanged to CreateAccountBloc when name is updated',
          (tester) async {
        const name = 'Dan';
        await tester.pumpWidget(
          MaterialApp(
              home: Scaffold(
                  body: BlocProvider.value(
            value: createAccountBloc,
            child: const CreateAccountForm(),
          ))),
        );
        await tester.enterText(find.byKey(nameInputKey), name);
        verify(
          () => createAccountBloc.add(const NameChanged(name: name)),
        ).called(1);
      });

      testWidgets(
          'adds EmailChanged to CreateAccountBloc when email is updated',
          (tester) async {
        const email = 'dan@ogundiran.com';
        await tester.pumpWidget(
          MaterialApp(
              home: Scaffold(
                  body: BlocProvider.value(
            value: createAccountBloc,
            child: const CreateAccountForm(),
          ))),
        );
        await tester.enterText(find.byKey(emailInputKey), email);
        verify(
          () => createAccountBloc.add(const EmailChanged(email: email)),
        ).called(1);
      });

      testWidgets(
          'adds FormSubmitted to CreateAccountBloc when form is '
          'submitted', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: createAccountBloc,
                child: const CreateAccountForm(),
              ),
            ),
          ),
        );
        await tester.tap(find.byKey(nextButtonKey));
        verify(
          () => createAccountBloc.add(const FormSubmitted()),
        ).called(1);
      });
    });
  });
}
