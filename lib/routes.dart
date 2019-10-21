import 'package:flutter/material.dart';

import 'screens/MainScreen.dart';

// Import your screens
// import 'screens/HomeScreen.dart';

// Give a route and link it to your screen class
Map<String, WidgetBuilder> routes = {
  "/main": (BuildContext context) => MainScreen(),
};
