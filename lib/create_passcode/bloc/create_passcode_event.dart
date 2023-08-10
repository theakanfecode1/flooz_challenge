import 'package:equatable/equatable.dart';

abstract class CreatePasscodeEvent extends Equatable {
  const CreatePasscodeEvent();

  @override
  List<Object> get props => [];
}

class PasscodeChanged extends CreatePasscodeEvent {
  const PasscodeChanged({required this.passcode});

  final String passcode;

  @override
  List<Object> get props => [passcode];
}

class FormSubmitted extends CreatePasscodeEvent {
  const FormSubmitted();
}