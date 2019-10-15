import 'package:ecodsa_app/blocs/events/bloc.dart';
import 'package:ecodsa_app/components/Cards/event_card.dart';
import 'package:ecodsa_app/components/Containers/full_height_container.dart';
import 'package:ecodsa_app/components/appBar.dart';
import 'package:ecodsa_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecodsa_app/style.dart' as Style;

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final eventsBloc = EventsBloc();
    return SafeArea(
      child: BlocProvider(
        builder: (context) => eventsBloc,
        child: RefreshIndicator(
          onRefresh: () async {
            eventsBloc.dispatch(GetEvents());
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: FullHeightContainer(
              child: BlocBuilder(
                bloc: eventsBloc,
                builder: (BuildContext ctx, EventsState state) {
                  if (state is InitialEventsState) {
                    eventsBloc.dispatch(GetEvents());
                    return Container();
                  } else if (state is LoadingEventsState) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Style.primaryColor,
                      ),
                    );
                  } else if (state is LoadedEventsState) {
                    return _buildEventsScreen(state.events);
                  } else {
                    return Center(
                      child: Text(
                        state is ErrorEventsState ? state.error : '',
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

  Widget _buildEventsScreen(List<Event> events) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomAppBar(),
          // TODO: Create search bar
          // TODO: Create header
          // TODO: Create filters
          Container(
            height: 20.0,
          ),
          ...events.map((event) => EventCard(
                event: event,
              )),
        ],
      ),
    );
  }
}
