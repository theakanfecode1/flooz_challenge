 import 'package:flooz_challenge/repository/authentication/authentication_repository.dart';

class AuthenticationEvent {
  const AuthenticationEvent();
}

 class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}