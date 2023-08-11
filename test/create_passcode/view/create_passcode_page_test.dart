import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_bloc.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_event.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_state.dart';
import 'package:flooz_challenge/create_passcode/view/create_passcode_form.dart';
import 'package:flooz_challenge/create_passcode/view/create_passcode_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreatePasscodeBloc
    extends MockBloc<CreatePasscodeEvent, CreatePasscodeState>
    implements CreatePasscodeBloc {}

void main() {
  late CreatePasscodeBloc createPasscodeBloc;

  setUp(() {
    createPasscodeBloc = MockCreatePasscodeBloc();
    when(() => createPasscodeBloc.state).thenReturn(const CreatePasscodeState());
  });

  group('CreatePasscodePage', () {
    test('is a page', () {
      expect(CreatePasscodePage.page(), isA<Page<void>>());
    });

    testWidgets('renders a CreatePasscodeForm', (tester) async {
      await tester.pumpWidget(BlocProvider.value(
          value: createPasscodeBloc,
          child: const MaterialApp(home: Scaffold(body: CreatePasscodePage()))));
      expect(find.byType(CreatePasscodeForm), findsOneWidget);
    });
  });
}
