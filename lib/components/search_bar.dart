import 'package:ecodsa_app/blocs/events/bloc.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EcodsaSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const EcodsaSearchBar({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: BlocProvider.of<EventsBloc>(context),
      child: Container(
        width: screenSize.width - 50,
        transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
          elevation: 2.0,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(50.0)),
          child: Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    textInputAction: TextInputAction.search,
                    onEditingComplete: () =>
                        BlocProvider.of<EventsBloc>(context)
                            .dispatch(GetEvents(searchQuery: controller.text)),
                    controller: controller,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Style.mutedColor,
                  ),
                  onPressed: () => BlocProvider.of<EventsBloc>(context)
                      .dispatch(GetEvents(searchQuery: controller.text)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
