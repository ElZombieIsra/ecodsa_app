import 'dart:ui';

import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import '../style.dart' as Style;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Style.primaryColor,),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(),
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 200.0,
                  // child: Image.asset("MainLogo.png"),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text("Bienvenido",
                    style: Style.mainMutedTitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}