import 'dart:async';
import 'package:ecodsa_app/models/user.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:ecodsa_app/services/api.dart';
import 'package:ecodsa_app/globals.dart' as globals;
import './bloc.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  bool loggedIn = false;
  User user;
  @override
  AppState get initialState => super.initialState ?? InitialAppState();

  AppBloc() {
    if (globals.appBloc == null) {
      globals.appBloc = this;
    }
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    print(event);
    if (event is InitialAppState) {
      this.dispatch(InitAppEvent());
    } else if (event is InitAppEvent) {
    } else if (event is UserLoggedInAppEvent) {
      loggedIn = true;
      user = event.user;
      yield InitedAppState(user, loggedIn);
    } else if (event is UserLoggedOutAppEvent) {
      loggedIn = false;
      user = null;
      yield InitedAppState(user, loggedIn);
    }
  }

  @override
  AppState fromJson(Map<String, dynamic> json) {
    try {
      print("AppBloc from json");
      loggedIn = json['loggedIn'];
      user = User.fromJson(json['user']);
      return InitedAppState(user, loggedIn);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(AppState state) {
    print("Appbloc to json");
    return {
      'loggedIn': loggedIn,
      'user': user.toJson(),
    };
  }
}
