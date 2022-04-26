import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

import '../Models/Address.dart';
import '../Models/Item.dart';
import '../Models/Provider.dart';
import 'auth_service.dart';

class ItemService {
  static final baseUrl = 'http://localhost:8000/api/';
  static final SESSION = FlutterSession();

 

  static Future get_all() async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "item/"),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data['results'] != null) {
      List<dynamic> items =
          data['results'].map((json) => Item.fromJsonMap(json)).toList();

      return items;
    }
    return null;
  }
  static Future get_one(int id) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "item/" + id.toString()),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data != null) {
      Item items =
          Item.fromJsonMap(data);

      return items;
    }
    return null;
  }
  static Future get_items_provider(Provider provider) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "item?username=" + provider.name!),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data['results'] != null) {
      List<dynamic> items =
          data['results'].map((json) => Item.fromJsonMap(json)).toList();

      return items;
    }
    return null;
  }
   static Future create(Item item) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = item.toJson();
    var req = await client.post(Uri.parse(baseUrl + "item/"),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Item items =
          Item.fromJsonMap(data);

      return items;
    }
    return null;
  }
     static Future update(Item item) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = item.toJson();
    var req = await client.put(Uri.parse(baseUrl + "item/" + item.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses =
          Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }
     static Future delete(Item item) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = item.toJson();
    var req = await client.delete(Uri.parse(baseUrl + "item/"  + item.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses =
          Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }
      static Future partial_update(Item item) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = item.toJson();
    var req = await client.patch(Uri.parse(baseUrl + "item/"  + item.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses =
          Address.fromJsonMap(data);

      return addresses;
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
