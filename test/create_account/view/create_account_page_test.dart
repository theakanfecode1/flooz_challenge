import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_bloc.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_event.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_state.dart';
import 'package:flooz_challenge/create_account/view/create_account_form.dart';
import 'package:flooz_challenge/create_account/view/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateAccountBloc
    extends MockBloc<CreateAccountEvent, CreateAccountState>
    implements CreateAccountBloc {}

void main() {
  late CreateAccountBloc createAccountBloc;

  setUp(() {
    createAccountBloc = MockCreateAccountBloc();
    when(() => createAccountBloc.state).thenReturn(const CreateAccountState());
  });

  group('CreateAccountPage', () {
    test('is a page', () {
      expect(CreateAccountPage.page(), isA<Page<void>>());
    });

    testWidgets('renders a CreateAccountForm', (tester) async {
      await tester.pumpWidget(BlocProvider.value(
          value: createAccountBloc,
          child: const MaterialApp(home: Scaffold(body: CreateAccountPage()))));
      expect(find.byType(CreateAccountForm), findsOneWidget);
    });
  });
}
