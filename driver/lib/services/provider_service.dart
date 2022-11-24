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
import 'package:safacw/services/constants.dart';

class ProviderService {
  // static final baseUrl = 'http://localhost:8000/api/';
  static final SESSION = FlutterSession();

  static Future get_all() async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "profiles/?type=3"),
        headers: {'Authorization': 'JWT $token'});
    final data = jsonDecode(req.body);

    if (data['results'] != null) {
      List<dynamic> providers =
          data['results'].map((json) => Provider.fromJsonMap(json)).toList();
      for (var i = 0; i < providers.length; i++) {
        List<dynamic> x = await ItemService.get_items_provider(providers[i]);

        var ints = new List<Item>.from(x);

        providers[i].items = ints;
      }

      return providers;
    }
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
