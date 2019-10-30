import 'package:ecodsa_app/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object> get props => null;
}

class InitAppEvent extends AppEvent {}

class UserLoggedInAppEvent extends AppEvent {
  final User user;

  UserLoggedInAppEvent(this.user);

  @override
  List<Object> get props => [this.user];
}
