import 'package:equatable/equatable.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends CreateAccountEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class NameChanged extends CreateAccountEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class FormSubmitted extends CreateAccountEvent {
  const FormSubmitted();
}