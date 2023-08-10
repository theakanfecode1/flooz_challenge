
import 'package:equatable/equatable.dart';
import 'package:flooz_challenge/create_account/models/email.dart';
import 'package:flooz_challenge/create_account/models/name.dart';
import 'package:formz/formz.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.email = const Email.pure(),
    this.name = const Name.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  final Email email;
  final Name name;
  final bool isValid;
  final FormzSubmissionStatus status;

  CreateAccountState copyWith({
    Email? email,
    Name? name,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return CreateAccountState(
      email: email ?? this.email,
      name: name ?? this.name,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, name, status];
}