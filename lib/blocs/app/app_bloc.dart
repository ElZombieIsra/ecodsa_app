import 'dart:async';
import 'package:bloc/bloc.dart';
// import 'package:ecodsa_app/services/api.dart';
import './bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  bool loggedIn = false;
  @override
  AppState get initialState => InitialAppState();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    print(event);
    if (event is InitialAppState) {
      this.dispatch(InitAppEvent());
    } else if (event is InitAppEvent) {}
  }
}
