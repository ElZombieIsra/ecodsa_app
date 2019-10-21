import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'globals.dart' as globals;
import 'routes.dart';
import 'screens/HomeScreen.dart';
import 'style.dart';

void main() async {
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: globals.title,
      theme: appTheme,
      home: HomeScreen(),
      routes: routes,
    );
  }
}
