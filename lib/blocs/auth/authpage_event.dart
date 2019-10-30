import 'package:equatable/equatable.dart';

abstract class AuthpageEvent extends Equatable {
  const AuthpageEvent();
  @override
  List<Object> get props => null;
}

class AuthPageRegister extends AuthpageEvent {
  final String name;
  final String email;
  final String password;

  AuthPageRegister(this.name, this.email, this.password);

  @override
  List<Object> get props => [this.name, this.email, this.password];
}

class AuthPageLogin extends AuthpageEvent {
  final String email;
  final String password;

  AuthPageLogin(this.email, this.password);

  @override
  List<Object> get props => [this.email, this.password];
}
