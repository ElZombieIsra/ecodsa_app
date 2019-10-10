import 'dart:async';

import 'package:ecodsa_app/services/network.dart';
// import 'package:ecodsa_app/globals.dart' as globals;

import 'package:flutter/foundation.dart' as Foundation;

class ExpoTenderosApi {
  NetworkService _netUtil = NetworkService();

  /// 10.0.2.2 Localhost tunel
  static const BASE_URL = Foundation.kReleaseMode
      ? "https://expotendero.org/api"
      : "http://192.168.100.253/tenderos/public/api";
  // static const BASE_URL = "https://expotendero.org/api";
  // static const BASE_URL = "http://192.168.100.253/tenderos/public/api";
  static const LOGIN_URL = BASE_URL + "/login";
  static const KEEPER_URL = BASE_URL + "/shopkeepers";
  static const ACTIVITY_URL = BASE_URL + "/activity";

  Future<dynamic> login(String username, String password) async {
    String url = "$LOGIN_URL?username=$username&password=$password";

    var res = await _netUtil.get(url);
    // print(res);
    if (res.length == 0) {
      throw Exception("No se encontró el usuario");
    }

    // if(res[0]["error"]) throw Exception(res["error_msg"]);

    return res;
  }

  Future syncCombos() async {
    var res = await _netUtil.get(ACTIVITY_URL);

    if (res.length == 0) {
      throw Exception("Error while reaching the API");
    }

    return res;
  }
}
