import 'package:equatable/equatable.dart';

import '../../models/event.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class InitialEventsState extends EventsState {}

class LoadingEventsState extends EventsState {}

class LoadedEventsState extends EventsState {
  final List<Event> events;
  final bool hasNextPage;

  LoadedEventsState(
    this.events, {
    this.hasNextPage = false,
  });

  @override
  List<Object> get props => [this.events, this.hasNextPage];
}

class ErrorEventsState extends EventsState {
  final dynamic error;

  ErrorEventsState(this.error);

  @override
  List<Object> get props => [this.error];
}
