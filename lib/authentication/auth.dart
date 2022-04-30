import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethod {
  AuthMethod();

  bool auth = false;
  late SharedPreferences prefs;
  final clientId = '1a0d47ee-f3eb-4440-a749-2bd2c858205f';
  final redirectURL = 'com.gradcoin.mobile.app://oauth/redirect';
  final discoveryURL =
      'https://gradcointesting.b2clogin.com/gradcointesting.onmicrosoft.com/v2.0/.well-known/openid-configuration?p=B2C_1_sign_in_sign_up';
  final List<String> scopes = [
    'openid',
    'https://gradcointesting.onmicrosoft.com/GradCoin-API/Read.Access'
  ];

  loadData() async {
    FlutterAppAuth _appauth = FlutterAppAuth();
    late AuthorizationTokenResponse result;
    try {
      result = (await _appauth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(clientId, redirectURL,
            discoveryUrl: discoveryURL, scopes: scopes),
      ))!;
      prefs = await SharedPreferences.getInstance();
      prefs.setString('token', result.accessToken!);
      prefs.setBool('auth', true);
      return true;
    } catch (e) {
      return false;
    }
  }
}
