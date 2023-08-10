
import 'package:equatable/equatable.dart';
import 'package:flooz_challenge/create_passcode/models/passcode.dart';
import 'package:formz/formz.dart';

class CreatePasscodeState extends Equatable {
  const CreatePasscodeState({
    this.passcode = const Passcode.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  final Passcode passcode;
  final bool isValid;
  final FormzSubmissionStatus status;

  CreatePasscodeState copyWith({
    Passcode? passcode,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return CreatePasscodeState(
      passcode: passcode ?? this.passcode,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [passcode, status];
}