import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

import '../Models/Address.dart';
import 'auth_service.dart';

class AddressService {
  static final baseUrl = 'http://localhost:8000/api/';
  static final SESSION = FlutterSession();

 

  static Future get_all() async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "address/"),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data['results'] != null) {
      List<dynamic> addresses =
          data['results'].map((json) => Address.fromJsonMap(json)).toList();

      return addresses;
    }
    return null;
  }
  static Future get_one(int id) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "address/" + id.toString()),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses =
          Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }
   static Future create(Address address) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_address = address.toJson();
    var req = await client.post(Uri.parse(baseUrl + "address/"),
        headers: {'Authorization': 'JWT $token'},
        body: new_address);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses =
          Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }
     static Future update(Address address) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_address = address.toJson();
    var req = await client.put(Uri.parse(baseUrl + "address/" + address.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_address);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses =
          Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }
     static Future delete(Address address) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_address = address.toJson();
    var req = await client.delete(Uri.parse(baseUrl + "address/"  + address.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_address);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses =
          Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }
      static Future partial_update(Address address) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_address = address.toJson();
    var req = await client.patch(Uri.parse(baseUrl + "address/"  + address.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_address);

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
