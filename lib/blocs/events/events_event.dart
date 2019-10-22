import 'package:equatable/equatable.dart';

abstract class EventsEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class GetEvents extends EventsEvent {
  final String searchQuery;

  GetEvents({this.searchQuery});

  @override
  List<Object> get props => [this.searchQuery];
}

class RefreshEvents extends EventsEvent {
  final String searchQuery;

  RefreshEvents({this.searchQuery});

  @override
  List<Object> get props => [this.searchQuery];
}

class FilterEvents extends EventsEvent {
  final Map<String, dynamic> filters;

  FilterEvents(this.filters);

  @override
  List<Object> get props => [this.filters];
}
