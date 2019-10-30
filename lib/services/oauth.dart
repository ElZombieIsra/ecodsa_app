import 'dart:io';

import 'package:oauth2/oauth2.dart' as oauth2;
import 'api.dart';

class EcodsaOAuth {
  static final String _oauthEndpoint = EcodsaApi.OAUTH_URL;
  static final Uri authorizationEndpoint = Uri.parse("$_oauthEndpoint/token");
  static final Uri tokenEndpoint = Uri.parse("$_oauthEndpoint/token");
  static final identifier = "3";
  static final String secret = "N8bQhZCM76ZBcHfOpY54hkYVbAPywabZ88eInkFV";
  oauth2.Client client;

  static EcodsaOAuth _instance = EcodsaOAuth.internal();
  EcodsaOAuth.internal();
  factory EcodsaOAuth() => _instance;

  Future<oauth2.Client> getClient({String username, String password}) async {
    if (client == null) {
      client = await oauth2.resourceOwnerPasswordGrant(
          authorizationEndpoint, username, password,
          identifier: identifier, secret: secret);
      new File("${Directory.current.path}/credentials.json")
          .writeAsString(client.credentials.toJson());
    }
    return client;
  }

  void dispose() {
    if (client != null) {}
  }
}
