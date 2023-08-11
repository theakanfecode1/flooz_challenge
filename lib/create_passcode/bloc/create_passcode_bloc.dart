import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_event.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_state.dart';
import 'package:flooz_challenge/create_passcode/models/passcode.dart';
import 'package:flooz_challenge/repository/authentication/authentication_repository.dart';
import 'package:formz/formz.dart';



class CreatePasscodeBloc extends Bloc<CreatePasscodeEvent, CreatePasscodeState> {
  CreatePasscodeBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,super(const CreatePasscodeState()) {
    on<PasscodeChanged>(_onPasscodeChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;


  void _onPasscodeChanged(PasscodeChanged event, Emitter<CreatePasscodeState> emit) {
    final passcode = Passcode.dirty(event.passcode);
    emit(
      state.copyWith(
        passcode: passcode,
        isValid: Formz.validate([passcode]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
      FormSubmitted event,
      Emitter<CreatePasscodeState> emit,
      ) async {
    final passcode = Passcode.dirty(state.passcode.value);
    emit(
      state.copyWith(
        passcode: passcode,
        isValid: Formz.validate([passcode]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
       _authenticationRepository.authenticatedUser();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }else{
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}