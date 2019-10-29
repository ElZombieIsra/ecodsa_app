import 'package:flutter/material.dart';

import 'screens/MainScreen.dart';
import 'screens/auth/authScreen.dart';
import 'screens/termsScreen.dart';

// Import your screens
// import 'screens/HomeScreen.dart';

// Give a route and link it to your screen class
Map<String, WidgetBuilder> routes = {
  "/main": (BuildContext context) => MainScreen(),
  "/terms": (BuildContext context) => EcodsaTermsScreen(),
  "/login": (BuildContext context) => AuthScreen(),
};
