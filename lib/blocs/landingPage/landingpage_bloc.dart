import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecodsa_app/models/landing_feature.dart';
import 'package:ecodsa_app/services/api.dart';
import './bloc.dart';

class LandingpageBloc extends Bloc<LandingpageEvent, LandingpageState> {
  final _api = EcodsaApi();

  @override
  LandingpageState get initialState => InitialLandingpageState();

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
          .map((feature) => LandingFeature.fromJson(feature))
          .toList();
    }
    return data;
  }
}
