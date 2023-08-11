import 'package:bloc_test/bloc_test.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_bloc.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_event.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_state.dart';
import 'package:flooz_challenge/create_account/models/email.dart';
import 'package:flooz_challenge/create_account/models/name.dart';
import 'package:flooz_challenge/repository/user/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserRepository userRepository;
  const validEmail = 'dan@ogundiran.com';
  const validName = 'Dan';

  setUp(() {
    userRepository = MockUserRepository();
  });

  group('CreateAccountBloc', () {
    test('initial state is CreateAccountState', () {
      expect(CreateAccountBloc(userRepository: userRepository).state,
          const CreateAccountState());
    });

    group('FormSubmitted', () {
      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits [submissionInProgress, submissionSuccess] on valid form '
        'submission',
        build: () => CreateAccountBloc(userRepository: userRepository),
        act: (bloc) => bloc
          ..add(const NameChanged(name: validName))
          ..add(const EmailChanged(email: validEmail))
          ..add(const FormSubmitted()),
        expect: () => const <CreateAccountState>[
          CreateAccountState(name: Name.dirty(validName)),
          CreateAccountState(
            name: Name.dirty(validName),
            email: Email.dirty(validEmail),
            isValid: true,
          ),
          CreateAccountState(
            name: Name.dirty(validName),
            email: Email.dirty(validEmail),
            status: FormzSubmissionStatus.inProgress,
            isValid: true,
          ),
          CreateAccountState(
            name: Name.dirty(validName),
            email: Email.dirty(validEmail),
            status: FormzSubmissionStatus.success,
            isValid: true,
          ),
        ],
      );

      blocTest<CreateAccountBloc, CreateAccountState>(
        'emits [submissionInProgress, submissionFailure] on invalid submission',
        build: () => CreateAccountBloc(userRepository: userRepository),
        act: (bloc) => bloc.add(const FormSubmitted()),
        expect: () => const <CreateAccountState>[
          CreateAccountState(
            status: FormzSubmissionStatus.initial,
              email: Email.dirty(),
              name: Name.dirty(),
              isValid: false),
          CreateAccountState(
            status: FormzSubmissionStatus.inProgress,
              email: Email.dirty(),
              name: Name.dirty(),
              isValid: false),
          CreateAccountState(
            status: FormzSubmissionStatus.failure,
              email: Email.dirty(),
              name: Name.dirty(),
              isValid: false),
        ],
      );
    });
  });
}
