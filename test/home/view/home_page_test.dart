import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_challenge/authentication/bloc/authentication_bloc.dart';
import 'package:flooz_challenge/authentication/bloc/authentication_event.dart';
import 'package:flooz_challenge/authentication/bloc/authentication_state.dart';
import 'package:flooz_challenge/home/view/home_page.dart';
import 'package:flooz_challenge/repository/user/models/user.dart';
import 'package:flooz_challenge/res/components/flooz_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  late AuthenticationBloc authenticationBloc;

  group('HomePage', () {
    setUp(() {
      authenticationBloc = MockAuthenticationBloc();
      when(() => authenticationBloc.state).thenReturn(
          const AuthenticationState.authenticated(User('Dan', 'Dan@dan.com')));
    });

    test('is a Page', () {
      expect(HomePage.page(), isA<Page<void>>());
    });

    group('renders', () {
      testWidgets('renders UI elements', (tester) async {
        await tester.pumpWidget(BlocProvider.value(
            value: authenticationBloc,
            child: const MaterialApp(home: Scaffold(body: HomePage()))));
        expect(find.byType(Image), findsOneWidget);
        expect(find.byType(Text), findsNWidgets(4));
        expect(find.byType(FloozButton), findsNWidgets(2));
      });

      testWidgets('renders UI elements with authenticated user details', (tester) async {
        await tester.pumpWidget(BlocProvider.value(
            value: authenticationBloc,
            child: const MaterialApp(home: Scaffold(body: HomePage()))));
        expect(find.text('Dan'), findsOneWidget);
        expect(find.text('Dan@dan.com'), findsOneWidget);
      });
    });
  });
}
