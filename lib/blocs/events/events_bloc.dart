import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import './bloc.dart';
import '../../models/event.dart';
import '../../services/api.dart';

class EventsBloc extends HydratedBloc<EventsEvent, EventsState> {
  final _api = EcodsaApi();
  @override
  EventsState get initialState => super.initialState ?? InitialEventsState();

  @override
  Stream<EventsState> mapEventToState(
    EventsEvent event,
  ) async* {
    if (event is GetEvents) {
      yield LoadingEventsState();
      try {
        List<dynamic> eventsJson = await _api.getEvents();
        List<Event> events =
            eventsJson.map((event) => Event.fromJson(event)).toList();
        yield LoadedEventsState(events);
      } catch (e) {
        print(e);
        yield ErrorEventsState(e.toString());
      }
    }
  }

  @override
  EventsState fromJson(Map<String, dynamic> json) {
    try {
      final events =
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
      print('Saving state');
      return {
        'events': state.events.map((event) => event.toJson()).toList(),
      };
    } else {
      return null;
    }
  }
}
