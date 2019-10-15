import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecodsa_app/models/event.dart';
import 'package:ecodsa_app/services/api.dart';
import './bloc.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final _api = EcodsaApi();
  @override
  EventsState get initialState => InitialEventsState();

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
}
