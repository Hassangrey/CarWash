import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:safacw/services/constants.dart';

class AuthService {
  // static final baseUrl = 'http://senior-project-api.herokuapp.com'; because we're poor
  // static final baseUrl = 'http://192.168.0.116:8000';

  // ignore: non_constant_identifier_names
  static final SESSION = FlutterSession();

  static Future<dynamic> register(
      String email, String username, String password) async {
    try {
      var res =
          await http.post(Uri.parse('$baseUrlForAuth/auth/users/'), body: {
        'email': email,
        'username': username,
        'password': password,
      });
      return res;
    } finally {
      // done you can do something here
    }
  }

  static Future<dynamic> login(String username, String password) async {
    try {
      var res = await http.post(
        Uri.parse('$baseUrlForAuth/auth/jwt/create/'),
        body: {
          'username': username,
          'password': password,
        },
      );

      return res;
    } catch (error) {
      print("error occured" + error.toString());
    } finally {
      // you can do somethig here
    }
  }

  static setToken(String token, String refreshToken) async {
    _AuthData data = _AuthData(token, refreshToken);
    await SESSION.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  static removeToken() async {
    await SESSION.prefs.clear();
  }
}

class _AuthData {
  String token, refreshToken;
  //String? clientId;
  _AuthData(this.token, this.refreshToken);

  // toJson
  // required by Session lib
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    //  data['clientId'] = clientId;
    return data;
  }
}
