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
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2))
        .then((_) => Navigator.pushReplacementNamed(context, "/main"));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenSize.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  '${globals.kImagesUrl}loading_page_background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.7, 0.9],
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.3),
                      Color.fromRGBO(47, 56, 80, 0.95),
                      Color.fromRGBO(20, 29, 47, 1),
                    ],
                  ),
                ),
              ),
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
                  child: Image.asset('${globals.kImagesUrl}logo-blanco@3x.png'),
                  // margin: EdgeInsets.all(10.0),
                  width: screenSize.width / 1.5,
                  // height: screenSize.width / 1.5,
                ),
                Container(
                  // margin: EdgeInsets.all(5.0),
                  child: Text(
                    "Bienvenido",
                    style: TextStyle(
                      color: Style.mutedColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
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
