import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecodsa_app/models/landing_feature.dart';
import 'package:ecodsa_app/services/api.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import './bloc.dart';

class LandingpageBloc extends HydratedBloc<LandingpageEvent, LandingpageState> {
  final _api = EcodsaApi();

  @override
  LandingpageState get initialState =>
      super.initialState ?? InitialLandingpageState();

  @override
  Stream<LandingpageState> mapEventToState(
    LandingpageEvent event,
  ) async* {
    if (event is InitialLandingpageState) {
      // this.dispatch(GetLandingPage());
    } else if (event is GetLandingPage) {
      yield LoadingLandingPage();
      try {
        final data = await _fetchLandingPageFromApi();
        yield LoadedLandingPage(data);
      } catch (e) {
        yield ErrorLandingPage(e);
      }
    }
  }

  Future<Map<String, dynamic>> _fetchLandingPageFromApi() async {
    Map<String, dynamic> data = await _api.getLandingPage();
    print('fetched data');
    if (data["features"] != null || data["features"].length > 0) {
      data["features"] = data["features"]
          .map<LandingFeature>((feature) => LandingFeature.fromJson(feature))
          .toList();
      print(data);
    }
    print('fetched data');
    return data;
  }

  @override
  LandingpageState fromJson(Map<String, dynamic> json) {
    try {
      var data = json;
      data["features"] = data["features"]
          .map<LandingFeature>((feature) => LandingFeature.fromJson(feature))
          .toList();
      print('getting data');
      print(data["features"]);
      print('getting data');
      return LoadedLandingPage(data);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(LandingpageState state) {
    if (state is LoadedLandingPage) {
      var json = state.data;
      // json["features"] =
      //     json["features"].map((feature) => feature.toJson()).toList();
      print('saving data');
      print(json["features"]);
      print('saving data');
      return json;
    } else {
      return null;
    }
  }
}
