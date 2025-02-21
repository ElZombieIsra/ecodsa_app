import 'package:ecodsa_app/blocs/events/bloc.dart';
import 'package:ecodsa_app/models/category.dart';
import 'package:ecodsa_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../style.dart' as Style;

class EcodsaEventsFilters extends StatefulWidget {
  @override
  _EcodsaEventsFiltersState createState() => _EcodsaEventsFiltersState();
}

class _EcodsaEventsFiltersState extends State<EcodsaEventsFilters> {
  List<Category> filters = [];
  int _dropVal1;
  int _dropVal2;
  bool _historicFlag = false;

  @override
  void initState() {
    super.initState();
    _createFilters();
  }

  void _createFilters() async {
    var categories = await EcodsaApi().getCategories();
    if (this.mounted) {
      setState(() {
        filters = categories
            .map<Category>((category) => Category.fromJson(category))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: BlocProvider.of<EventsBloc>(context),
      child: Container(
        width: screenSize.width - 20,
        transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton(
                  hint: Text(
                    "Filtrar",
                    style: Style.mutedText(fontSize: 14.0),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  items: filters
                      .map((Category cat) => DropdownMenuItem(
                            value: cat.id,
                            child: Text(cat.name),
                          ))
                      .toList(),
                  icon: Icon(Icons.arrow_drop_down),
                  underline: Container(),
                  value: _dropVal1,
                  onChanged: (_) {
                    BlocProvider.of<EventsBloc>(context)
                        .dispatch(FilterEvents({'category': _}));
                    setState(() => _dropVal1 = _);
                  },
                ),
                DropdownButton(
                  hint: Text(
                    "Ordenar por",
                    style: Style.mutedText(fontSize: 14.0),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text("Fecha - ASC"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Fecha - DESC"),
                      value: 2,
                    ),
                  ],
                  icon: Icon(Icons.arrow_drop_down),
                  underline: Container(),
                  value: _dropVal2,
                  onChanged: (_) {
                    BlocProvider.of<EventsBloc>(context)
                        .dispatch(FilterEvents({'orderBy': _}));
                    setState(() => _dropVal2 = _);
                  },
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text("Historicos"),
                      Checkbox(
                        activeColor: Style.primaryColor,
                        value: _historicFlag,
                        onChanged: (_val) =>
                            setState(() => _historicFlag = _val),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
