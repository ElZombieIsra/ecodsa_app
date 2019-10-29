import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];
}

class InitialAppState extends AppState {}

class InitedAppState extends AppState {
  final String email;

  InitedAppState(this.email);

  @override
  List<Object> get props => [this.email];
}
