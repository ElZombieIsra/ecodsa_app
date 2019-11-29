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
  List<Event> fullEvents;
  String nextPage;
  bool loading = false;

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
        yield LoadedEventsState(events,
            hasNextPage: nextPage != null ? true : false);
        lastSearch = event.searchQuery;
      } catch (e) {
        print(e);
        yield ErrorEventsState(e.toString());
      }
    } else if (event is RefreshEvents) {
      yield LoadingEventsState();
      try {
        events = await _fetchEvents(event.searchQuery);
        yield LoadedEventsState(events,
            hasNextPage: nextPage != null ? true : false);
      } catch (e) {
        print(e);
        yield ErrorEventsState(e.toString());
      }
    } else if (event is FilterEvents) {
      yield LoadingEventsState();
      // TODO: Fix this logic to filter from all events
      if (event.filters['orderBy'] != null) {
        switch (event.filters['orderBy']) {
          case 1:
            events.sort((a, b) => a.dateStart.compareTo(b.dateStart));
            break;
          case 2:
            events.sort((a, b) => b.dateStart.compareTo(a.dateStart));
            break;
          default:
            yield ErrorEventsState("No se ha encontrado ese filtro");
            break;
        }
        yield LoadedEventsState(events,
            hasNextPage: nextPage != null ? true : false);
      }
      if (event.filters['category'] != null) {
        yield LoadedEventsState(
            events
                .where((_event) => _event.category == event.filters['category'])
                .toList(),
            hasNextPage: nextPage != null ? true : false);
      }
    } else if (event is FetchNextEvents && !loading && nextPage != null) {
      loading = true;
      print("Next events");
      events.addAll(await _fetchEvents(event.searchQuery, url: nextPage));
      yield LoadedEventsState(events,
          hasNextPage: nextPage != null ? true : false);
      loading = false;
    }
  }

  Future<List<Event>> _fetchEvents(String query, {String url}) async {
    Map<String, dynamic> eventsJson = await _api.getEvents(
      searchQuery: query,
      nextUrl: url,
    );
    lastEventsJson = eventsJson;
    nextPage = eventsJson["next_page_url"];
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
