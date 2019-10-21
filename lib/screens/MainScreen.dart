import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';

import 'mainScreen/eventsScreen.dart';
import 'mainScreen/indexScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _navigationIndex = 0;
  final List<Widget> _widgets = [
    IndexScreen(),
    EventsScreen(),
    Container(
        child: Center(child: Text("No estás registrado a ningún evento"))),
    Container(child: Center(child: Text("No tienes ningún evento activo"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[_navigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Style.primaryColor,
        unselectedItemColor: Style.mutedColor,
        currentIndex: _navigationIndex,
        onTap: (_) => setState(() => _navigationIndex = _),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("Inicio"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Eventos"),
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            title: Text("Inscribirse"),
            icon: Icon(Icons.done),
          ),
          BottomNavigationBarItem(
            title: Text("Mapa"),
            icon: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
