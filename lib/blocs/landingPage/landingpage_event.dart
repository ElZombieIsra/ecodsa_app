import 'package:equatable/equatable.dart';

abstract class LandingpageEvent extends Equatable {
  const LandingpageEvent();
  @override
  List<Object> get props => null;
}

class GetLandingPage extends LandingpageEvent {}
