import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import './bloc.dart';
import '../../models/event.dart';
import '../../services/api.dart';

class EventsBloc extends HydratedBloc<EventsEvent, EventsState> {
  final _api = EcodsaApi();
  Map<String, dynamic> lastEventsJson;
  String lastSearch;
  List<Event> events;

  @override
  EventsState get initialState => super.initialState ?? InitialEventsState();

  @override
  Stream<EventsState> mapEventToState(
    EventsEvent event,
  ) async* {
    if (event is GetEvents && event.searchQuery != lastSearch) {
      yield LoadingEventsState();
      try {
        events = await _fetchEvents(event.searchQuery);
        yield LoadedEventsState(events);
        lastSearch = event.searchQuery;
      } catch (e) {
        print(e);
        yield ErrorEventsState(e.toString());
      }
    } else if (event is RefreshEvents) {
      yield LoadingEventsState();
      try {
        events = await _fetchEvents(event.searchQuery);
        yield LoadedEventsState(events);
      } catch (e) {
        print(e);
        yield ErrorEventsState(e.toString());
      }
    } else if (event is FilterEvents) {
      yield LoadingEventsState();
      if (event.filters['orderBy'] != null) {
        switch (event.filters['orderBy']) {
          case 1:
            events.sort((a, b) => a.dateStart.compareTo(b.dateStart));
            break;
          case 2:
            events.sort((a, b) => b.dateStart.compareTo(a.dateStart));
            break;
          default:
        }
      }
      yield LoadedEventsState(events);
    }
  }

  Future<List<Event>> _fetchEvents(String query) async {
    Map<String, dynamic> eventsJson = await _api.getEvents(searchQuery: query);
    lastEventsJson = eventsJson;
    return eventsJson["data"]
        .map<Event>((event) => Event.fromJson(event))
        .toList();
  }

  @override
  EventsState fromJson(Map<String, dynamic> json) {
    try {
      events =
          json["events"].map<Event>((event) => Event.fromJson(event)).toList();
      return LoadedEventsState(events);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(EventsState state) {
    if (state is LoadedEventsState) {
      // print('Saving state');
      return {
        'events': state.events.map((event) => event.toJson()).toList(),
      };
    } else {
      return null;
    }
  }
}
