import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import './bloc.dart';
import '../../models/landing_feature.dart';
import '../../services/api.dart';

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
    if (data["features"] != null || data["features"].length > 0) {
      data["features"] = data["features"]
          .map<LandingFeature>((feature) => LandingFeature.fromJson(feature))
          .toList();
    }
    return data;
  }

  @override
  LandingpageState fromJson(Map<String, dynamic> json) {
    try {
      var data = json;
      data["features"] = data["features"]
          .map<LandingFeature>((feature) => LandingFeature.fromJson(feature))
          .toList();
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
      return json;
    } else {
      return null;
    }
  }
}
