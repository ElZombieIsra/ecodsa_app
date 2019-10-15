import 'package:ecodsa_app/models/event.dart';
import 'package:equatable/equatable.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class InitialEventsState extends EventsState {}

class LoadingEventsState extends EventsState {}

class LoadedEventsState extends EventsState {
  final List<Event> events;

  LoadedEventsState(this.events);

  @override
  List<Object> get props => [this.events];
}

class ErrorEventsState extends EventsState {
  final dynamic error;

  ErrorEventsState(this.error);

  @override
  List<Object> get props => [this.error];
}
