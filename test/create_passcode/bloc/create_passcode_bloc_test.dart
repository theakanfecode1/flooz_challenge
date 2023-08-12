import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_bloc.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_event.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_state.dart';
import 'package:flooz_challenge/create_passcode/models/passcode.dart';
import 'package:flooz_challenge/repository/authentication/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;
  const validPasscode = '132453';


  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
  });

  group('CreatePasscodeBloc', () {
    test('initial state is CreatePasscodeState', () {
      expect(CreatePasscodeBloc(authenticationRepository: authenticationRepository).state,
          const CreatePasscodeState());
    });

    group('FormSubmitted', () {
      blocTest<CreatePasscodeBloc, CreatePasscodeState>(
        'emits [submissionInProgress, submissionSuccess] on valid form '
        'submission',
        build: () => CreatePasscodeBloc(authenticationRepository: authenticationRepository),
        act: (bloc) => bloc
          ..add(const PasscodeChanged(passcode: validPasscode))
          ..add(const FormSubmitted()),
        expect: () => const <CreatePasscodeState>[
          CreatePasscodeState(passcode: Passcode.dirty(validPasscode),isValid: true),
          CreatePasscodeState(
            passcode: Passcode.dirty(validPasscode),
            status: FormzSubmissionStatus.inProgress,
            isValid: true,
          ),
          CreatePasscodeState(
            passcode: Passcode.dirty(validPasscode),
            status: FormzSubmissionStatus.success,
            isValid: true,
          ),
        ],
      );

      blocTest<CreatePasscodeBloc, CreatePasscodeState>(
        'emits [submissionInProgress, submissionFailure] on invalid submission',
        build: () => CreatePasscodeBloc(authenticationRepository: authenticationRepository),
        act: (bloc) => bloc.add(const FormSubmitted()),
        expect: () => const <CreatePasscodeState>[
          CreatePasscodeState(
            status: FormzSubmissionStatus.initial,
              passcode: Passcode.dirty(),
              isValid: false),
          CreatePasscodeState(
            status: FormzSubmissionStatus.inProgress,
              passcode: Passcode.dirty(),
              isValid: false),
          CreatePasscodeState(
            status: FormzSubmissionStatus.failure,
              passcode: Passcode.dirty(),
            isValid: false
          ),
        ],
      );
    });
  });
}
