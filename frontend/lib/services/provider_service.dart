import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:safacw/services/item_service.dart';

import '../Models/Address.dart';
import '../Models/Item.dart';
import '../Models/Order.dart';
import '../Models/Provider.dart';
import 'auth_service.dart';

class ProviderService {
  static final baseUrl = 'http://localhost:8000/api/';
  static final SESSION = FlutterSession();

  static Future getProvidersProfile() async {
    var client = http.Client();
    // var token = (await AuthService.getToken())['token'];

    var req = await client
        .get(Uri.parse("http://192.168.8.104:8000/api" + "/profiles"));
    // headers: {'Authorization': 'JWT $token'}

    final data = jsonDecode(req.body);
    print(data);

    return null;
  }

  static Future get_one(int id) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "profiles/" + id.toString()),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data != null) {
      Provider orders = Provider.fromJsonMap(data);

      return orders;
    }
    return null;
  }
}

class UserAgentClient extends http.BaseClient {
  final String token;
  final http.Client _inner;

  UserAgentClient(this.token, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'bearer ${token}';
    return _inner.send(request);
  }
}
