import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:safacw/services/item_service.dart';

import 'package:safacw/Models/Address.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/CarWash.dart';
import 'package:safacw/Models/Order.dart';
import 'auth_service.dart';
import 'package:safacw/services/constants.dart';

class ProviderService {
  static const profilesEndPoint = 'profiles';
  static final SESSION = FlutterSession();

  // * Method to return the service providers of the car wash service
  static Future getProvidersProfile(String type) async {
    // * Make an http client to make a request. GET request in this case
    var client = http.Client();
    // var token = (await AuthService.getToken())['token'];
    // * Http response to handle the network responses
    http.Response? response;
    // * Fetch the users
    response = await client.get(
        Uri.parse(baseUrl + profilesEndPoint + '?type=3&provider=' + type));

    // headers: {'Authorization': 'JWT $token'}
    try {
      // * If OK. Return the list of the users
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> providers =
            data.map((json) => CarWash.fromJsonMap(json)).toList();
        for (var i = 0; i < providers.length; i++) {
          List<dynamic> x = await ItemService.get_items_provider(providers[i]);
          var ints = new List<Item>.from(x);
          providers[i].items = ints;
        }
        return providers;
      } else {
        // * Else, handle the other responses
        // TODO: Handle all the other network responses. (404, 401, 501...etc) properly
        print('Error in returning the providers profiles');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future get_one(int id) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "profiles/" + id.toString()),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data != null) {
      CarWash orders = CarWash.fromJsonMap(data);

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
