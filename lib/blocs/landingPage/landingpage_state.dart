import 'package:equatable/equatable.dart';

abstract class LandingpageState extends Equatable {
  const LandingpageState();
  @override
  List<Object> get props => [];
}

class InitialLandingpageState extends LandingpageState {}

class LoadingLandingPage extends LandingpageState {}

class LoadedLandingPage extends LandingpageState {
  final Map<String, dynamic> data;
  LoadedLandingPage(this.data);

  @override
  List<Object> get props => [this.data];
}

class ErrorLandingPage extends LandingpageState {
  final dynamic error;
  ErrorLandingPage(this.error);

  @override
  List<Object> get props => [this.error];
}
