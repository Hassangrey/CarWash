import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

import '../Models/Address.dart';
import '../Models/CarWash.dart';
import '../Models/Item.dart';
import 'auth_service.dart';
import 'package:safacw/services/constants.dart';
class ItemService {
  static final SESSION = FlutterSession();

  static Future get_all() async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "item/"),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data['results'] != null) {
      List<dynamic> items =
          data['results'].map((json) => Item.fromJson(json)).toList();

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
      Item items = Item.fromJson(data);

      return items;
    }
    return null;
  }

  static Future get_items_provider(String name) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    http.Response? req;
        
        req = await client.get(
      Uri.parse(baseUrl + "item?username=" + name));
      //  headers: {'Authorization': 'JWT $token'});
       


    


    try {
      // * If OK. Return the list of the users
      if (req.statusCode == 200) {
        final data = jsonDecode(req.body);
        List<dynamic> items =
            data.map((json) => Item.fromMap(json)).toList();
      

        return items;
      } else {
        // * Else, handle the other responses
        // TODO: Handle all the other network responses. (404, 401, 501...etc) properly
        print('Error in returning the providers profiles');
      }
    } catch (e) {
      log(e.toString());
    }    
  }

  static Future create(Item item) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = item.toJson();
    var req = await client.post(Uri.parse(baseUrl + "item/"),
        headers: {'Authorization': 'JWT $token'}, body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Item items = Item.fromJson(data);

      return items;
    }
    return null;
  }

  static Future update(Item item) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = item.toJson();
    var req = await client.put(
        Uri.parse(baseUrl + "item/" + item.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses = Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }

  static Future delete(Item item) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = item.toJson();
    var req = await client.delete(
        Uri.parse(baseUrl + "item/" + item.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses = Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }

  static Future partial_update(Item item) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = item.toJson();
    var req = await client.patch(
        Uri.parse(baseUrl + "item/" + item.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses = Address.fromJsonMap(data);

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
