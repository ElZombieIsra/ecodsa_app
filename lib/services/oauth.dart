// import 'package:oauth2/oauth2.dart' as oauth2;
import 'api.dart';

class EcodsaOAuth {
  static final String _oauthEndpoint = EcodsaApi.OAUTH_URL;
  static final Uri authorizationEndpoint =
      Uri.parse("$_oauthEndpoint/authorization");
  static final Uri tokenEndpoint = Uri.parse("$_oauthEndpoint/token");
  static final identifier = "3";
  static final String secret = "N8bQhZCM76ZBcHfOpY54hkYVbAPywabZ88eInkFV";
}
