import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:safacw/services/item_service.dart';


import 'package:safacw/Models/Address.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/Provider.dart';
import 'package:safacw/Models/Order.dart';
import 'auth_service.dart';

class ProviderService {
  static const baseUrl = 'http://localhost:8000/api/';
  static const profilesEndPoint = 'profiles';
  static final SESSION = FlutterSession();

  // * Method to return the service providers of the car wash service
  static Future getProvidersProfile() async {
    // * Make an http client to make a request. GET request in this case
    var client = http.Client();
    // var token = (await AuthService.getToken())['token'];
    // * Http response to handle the network responses
    http.Response? response;
    // * Fetch the users
    // ! USE YOUR MACHINE IP INSTEAD
    // ? Open the terminal, type in ifconfig. Your ip should start with 192.168...
    // ? Replace my IP with yours in the Uri.parse method below
    response = await client
        .get(Uri.parse("http://192.168.8.104:8000/api/" + profilesEndPoint));

    // headers: {'Authorization': 'JWT $token'}
    try {
      // * If OK. Return the list of the users
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse as List;
        // return (jsonResponse['data']) as List;
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
      MyProvider orders = MyProvider.fromJsonMap(data);

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
