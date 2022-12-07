import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:safacw/Models/User.dart';
import 'package:safacw/Models/User2.dart';
import 'package:safacw/Models/order_create.dart';
import 'package:safacw/models/profile.dart';
import 'package:safacw/services/constants.dart';

import '../Models/Address.dart';
import '../Models/Item.dart';
import '../Models/Order.dart';
import 'auth_service.dart';

class OrderService {
  static final SESSION = FlutterSession();

  static Future get_all() async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    User user = await getUser();
    var req;

    req = await client.get(
        Uri.parse(baseUrl + "order?username=" + user.username.toString()),
        headers: {
          'Authorization': 'JWT $token',
          'Content-Type': 'application/json; charset=UTF-8',
        });

    final data = jsonDecode(req.body);
    List<dynamic> items = data.map((json) => Order.fromMap(json)).toList();

    return items;
  }

  static Future get_one(int id) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    print("id is $id");

    var req = await client.get(Uri.parse(baseUrl + "order/" + id.toString()),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);
    print("fff $data");
    if (data != null) {
      Order orders = Order.fromMap(data);

      return orders;
    }
    return null;
  }

  static Future create(OrderCreate order, SP, latt, long) async {
    var sp = await OrderService.getSpecificUser(SP.name);
    User user = await getUser();
    order.service_provider = sp.id.toString();
    order.user = user.id.toString();
    order.status = 'INITIAL';
    order.latt = latt;
    order.long = long;
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_order = order.toJson();

    var req = await client.post(Uri.parse(baseUrl + "order/"),
        headers: {
          'Authorization': 'JWT $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: new_order);

    final data = jsonDecode(req.body);
    print(data);
    // if (data != null) {
    //   Item items = Item.fromJson(data);

    //   return items;
    // }
    return null;
  }

  static Future update(Order order) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_order = order.toJson();
    var req = await client.put(
        Uri.parse(baseUrl + "order/" + order.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_order);

    final data = jsonDecode(req.body);

    if (data != null) {
      Order addresses = Order.fromJson(data);

      return addresses;
    }
    return null;
  }

  static Future delete(Order order) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = order.toJson();
    var req = await client.delete(
        Uri.parse(baseUrl + "order/" + order.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses = Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }

  static Future partial_update(Order order) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var new_item = order.toJson();
    var req = await client.patch(
        Uri.parse(baseUrl + "order/" + order.id.toString() + '/'),
        headers: {'Authorization': 'JWT $token'},
        body: new_item);

    final data = jsonDecode(req.body);

    if (data != null) {
      Address addresses = Address.fromJsonMap(data);

      return addresses;
    }
    return null;
  }

  static Future getUser() async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var req = await client.get(Uri.parse(baseUrlForAuth + "/auth/users/me/"),
        headers: {'Authorization': 'JWT $token'});

    final userData = jsonDecode(req.body);
    print("User here $userData");
    User user = User.fromMap(userData);
    // print("User here after $userData");

    return user;
  }

  static Future getProfile(username) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var req = await client.get(Uri.parse(baseUrl + "profiles/${username}"),
        headers: {'Authorization': 'JWT $token'});

    final userData = jsonDecode(req.body);

    var profile = Profile.fromMap(userData);

    return profile;

    // print("User here after $userData");
  }

  static Future getSpecificUser(username) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var req = await client.get(Uri.parse(baseUrlForAuth + "/auth/users/"),
        headers: {'Authorization': 'JWT $token'});

    final userData = jsonDecode(req.body);
    // print(userData);
    List<dynamic> users = userData.map((json) => User2.fromMap(json)).toList();
    // print(users);
    var id = null;

    users.forEach((element) {
      // print(element);

      if (element.username == username) {
        id = element;
        return element;
      }
    });
    return id;

    // print("User here after $userData");
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
