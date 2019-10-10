import 'package:flutter/material.dart';
import 'package:ecodsa_app/style.dart' as Style;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _navigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Bienvenido"),
      ),
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
