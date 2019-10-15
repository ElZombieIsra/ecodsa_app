import 'dart:async';

import 'package:ecodsa_app/services/network.dart';
// import 'package:ecodsa_app/globals.dart' as globals;

import 'package:flutter/foundation.dart' as Foundation;

class EcodsaApi {
  NetworkService _netUtil = NetworkService();

  static const PC_LOCALHOST_URL = "http://10.0.2.2";
  static const PROD_URL = "https://apps.cinteractivo.mx/ecodsa/public/api";
  static const LOCAL_URL = "http://192.168.100.253/ecodsa/public/api";
  static const BASE_URL = Foundation.kReleaseMode ? PROD_URL : LOCAL_URL;
  // static const BASE_URL = PROD_URL;
  static const LOGIN_URL = BASE_URL + "/login";
  static const KEEPER_URL = BASE_URL + "/shopkeepers";
  static const ACTIVITY_URL = BASE_URL + "/activity";

  Future<dynamic> getLandingPage() async {
    // await Future.delayed(Duration(seconds: 2));
    String url = "$BASE_URL/landingPage";
    try {
      var res = await _netUtil.get(url);
      // print(res);
      if (res.length == 0) {
        throw Exception("Ocurrio un error al contactar el servidor");
      }
      return res;
    } catch (e) {
      print(e);
      throw Exception("Ocurrió un error al conectarse al servidor.");
    }
  }
}
