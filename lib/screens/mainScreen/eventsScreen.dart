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

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final TextEditingController controller = TextEditingController();
  final _scrollController = ScrollController();
  final _scrollThreshold = 50.0;
  final eventsBloc = EventsBloc();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        builder: (context) => eventsBloc,
        child: RefreshIndicator(
          onRefresh: () async {
            eventsBloc.dispatch(RefreshEvents(searchQuery: controller.text));
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            child: BlocListener<EventsBloc, EventsState>(
              listener: (ctx, state) {},
              child: BlocBuilder(
                bloc: eventsBloc,
                builder: (BuildContext ctx, EventsState state) {
                  List<Widget> _widgets = [
                    CustomAppBar(),
                    EcodsaSearchBar(
                      controller: controller,
                    ),
                    StainHeader(
                      title: "Eventos",
                      subtitle: "Inscripciones y reservaciones",
                    ),
                    EcodsaEventsFilters(),
                  ];
                  if (state is InitialEventsState) {
                    eventsBloc.dispatch(GetEvents());
                    _widgets.add(FullHeightContainer(child: Container()));
                  } else if (state is LoadingEventsState) {
                    _widgets.add(Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Style.primaryColor,
                      ),
                    ));
                  } else if (state is LoadedEventsState) {
                    _widgets.addAll(
                      state.events.map((event) => EventCard(event: event)),
                    );
                    if (state.hasNextPage) {
                      _widgets.add(Container(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Style.primaryColor,
                          ),
                        ),
                      ));
                    }
                  } else {
                    _widgets.add(FullHeightContainer(
                      child: Center(
                        child: Text(
                          state is ErrorEventsState ? state.error : '',
                        ),
                      ),
                    ));
                  }
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _widgets,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    eventsBloc.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      eventsBloc.dispatch(FetchNextEvents());
    }
  }
}
