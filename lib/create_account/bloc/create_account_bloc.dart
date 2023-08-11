import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_event.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_state.dart';
import 'package:flooz_challenge/create_account/models/email.dart';
import 'package:flooz_challenge/create_account/models/name.dart';
import 'package:flooz_challenge/repository/user/user_repository.dart';
import 'package:formz/formz.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const CreateAccountState()) {
    on<EmailChanged>(_onEmailChanged);
    on<NameChanged>(_onNameChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  final UserRepository _userRepository;

  void _onEmailChanged(EmailChanged event, Emitter<CreateAccountState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.name]),
      ),
    );
  }

  void _onNameChanged(NameChanged event, Emitter<CreateAccountState> emit) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([name, state.email]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<CreateAccountState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    final name = Name.dirty(state.name.value);
    emit(
      state.copyWith(
        email: email,
        name: name,
        isValid: Formz.validate([email, name]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      _userRepository.setUser(name.value, email.value);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}
