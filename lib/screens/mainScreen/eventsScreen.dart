import 'package:ecodsa_app/components/filters.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/events/bloc.dart';
import '../../components/Cards/event_card.dart';
import '../../components/Containers/full_height_container.dart';
import '../../components/appBar.dart';
import '../../components/search_bar.dart';
import '../../components/stain_header.dart';
import '../../models/event.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final eventsBloc = EventsBloc();
    return SafeArea(
      child: BlocProvider(
        builder: (context) => eventsBloc,
        child: RefreshIndicator(
          onRefresh: () async {
            eventsBloc.dispatch(RefreshEvents(searchQuery: controller.text));
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: BlocListener<EventsBloc, EventsState>(
              listener: (ctx, state) {},
              child: BlocBuilder(
                bloc: eventsBloc,
                builder: (BuildContext ctx, EventsState state) {
                  if (state is InitialEventsState) {
                    eventsBloc.dispatch(GetEvents());
                    return FullHeightContainer(child: Container());
                  } else if (state is LoadingEventsState) {
                    return FullHeightContainer(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Style.primaryColor,
                        ),
                      ),
                    );
                  } else if (state is LoadedEventsState) {
                    return _buildEventsScreen(state.events, controller);
                  } else {
                    return FullHeightContainer(
                      child: Center(
                        child: Text(
                          state is ErrorEventsState ? state.error : '',
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventsScreen(
    List<Event> events,
    TextEditingController controller,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomAppBar(),
          EcodsaSearchBar(
            controller: controller,
          ),
          StainHeader(
            title: "Eventos",
            subtitle: "Inscripciones y reservaciones",
          ),
          EcodsaEventsFilters(),
          ...events.map((event) => EventCard(event: event)),
        ],
      ),
    );
  }
}
