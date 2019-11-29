import 'dart:async';
// import 'dart:convert';

import 'package:ecodsa_app/models/user.dart';
import 'package:ecodsa_app/services/oauth.dart';
import 'package:flutter/foundation.dart' as Foundation;

import 'network.dart';

class EcodsaApi {
  NetworkService _netUtil = NetworkService();

  static const PC_LOCALHOST_URL = "http://10.0.2.2";
  static const PROD_URL = "https://apps.cinteractivo.mx/ecodsa/public";
  static const LOCAL_URL = "http://192.168.100.30/ecodsa/public";
  static const BASE_URL = Foundation.kReleaseMode ? PROD_URL : LOCAL_URL;
  // static const BASE_URL = PROD_URL;
  static const API_URL = "$BASE_URL/api";
  static const OAUTH_URL = "$BASE_URL/oauth";
  static const EVENTS_URL = API_URL + "/event";
  static const KEEPER_URL = API_URL + "/shopkeepers";
  static const ACTIVITY_URL = API_URL + "/activity";
  static const REGISTER_URL = API_URL + "/register";
  static const LOGIN_URL = OAUTH_URL + "/token";

  Future<dynamic> getLandingPage() async {
    // await Future.delayed(Duration(seconds: 2));
    String url = "$API_URL/landingPage";
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

  Future<dynamic> getEvents({String searchQuery, String nextUrl}) async {
    try {
      String url = nextUrl != null ? nextUrl : "$EVENTS_URL";
      if (searchQuery != null) url += "?searchQuery=$searchQuery";
      var res = await _netUtil.get(url);
      if (res.length == 0)
        throw Exception("Ocurrió un error al conectarse al servidor");
      return res["events"];
    } catch (e) {
      print(e);
      throw Exception("Ocurrió un error al conectarse al servidor");
    }
  }

  Future<dynamic> getCategories() async {
    try {
      var res = await _netUtil.get("$API_URL/categories");
      return res;
    } catch (e) {
      throw Exception("Error");
    }
  }

  Future<User> register(String name, String email, String password) async {
    try {
      var res = await _netUtil.post(REGISTER_URL, body: {
        'name': name,
        'email': email,
        'password': password,
      });
      if (res["token_type"] == null) {
        throw Exception("Ocurrió un error al registarte");
      }
      return await getUser(
        accessToken: res["access_token"],
        refreshToken: res["refresh_token"],
      );
    } catch (e) {
      print(e.toString());
      throw Exception("Ocurrió un error al registarte");
    }
  }

  Future<User> login(String email, String password) async {
    try {
      var res = await _netUtil.post(LOGIN_URL, body: {
        'grant_type': 'password',
        'client_id': EcodsaOAuth.identifier,
        'client_secret': EcodsaOAuth.secret,
        'username': email,
        'password': password,
        'scope': '*'
      });

      return await getUser(
        accessToken: res["access_token"],
        refreshToken: res["refresh_token"],
      );
    } catch (e) {
      print(e.toString());
      throw Exception("Ocurrió un error al iniciar sesión");
    }
  }

  Future<User> getUser({String accessToken, String refreshToken}) async {
    try {
      Map<String, String> headers = {'Authorization': "Bearer $accessToken}"};
      var res2 = await _netUtil.get(
        "$API_URL/user",
        headers: headers,
      );
      res2['access_token'] = accessToken;
      res2['refresh_token'] = refreshToken;
      return User.fromJson(res2);
    } catch (e) {
      print(e);
      throw Exception("Error al obtener el usuario");
    }
  }
}
