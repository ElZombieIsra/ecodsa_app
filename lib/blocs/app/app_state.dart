import 'package:ecodsa_app/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];
}

class InitialAppState extends AppState {}

class InitedAppState extends AppState {
  final User user;
  final bool loggedIn;

  InitedAppState(this.user, this.loggedIn);

  @override
  List<Object> get props => [this.user, this.loggedIn];
}
