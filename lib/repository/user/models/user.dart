import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.name,this.email);

  final String name;
  final String email;

  @override
  List<Object> get props => [name,email];

  static const empty = User('-','-');
}