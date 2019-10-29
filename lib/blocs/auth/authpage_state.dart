import 'package:ecodsa_app/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthpageState extends Equatable {
  const AuthpageState();
  @override
  List<Object> get props => [];
}

class InitialAuthpageState extends AuthpageState {}

class LoadingAuthpageState extends AuthpageState {}

class LoadedAuthpageState extends AuthpageState {
  final User user;

  LoadedAuthpageState(this.user);

  @override
  List<Object> get props => [this.user];
}
