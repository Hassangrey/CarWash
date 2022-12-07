import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:safacw/Models/Profile2.dart';
import 'package:safacw/Models/User.dart';
import 'package:safacw/Models/User2.dart';
import 'package:safacw/Models/accepted_order.dart';
import 'package:safacw/Models/order_address.dart';
import 'package:safacw/Models/profile.dart';

import '../Models/Address.dart';
import '../Models/Item.dart';
import '../Models/Order.dart';
import 'auth_service.dart';
import 'package:safacw/services/constants.dart';
import 'dart:developer';

class OrderService {
  // static final baseUrl = 'http://localhost:8000/api/';
  static final SESSION = FlutterSession();

  static Future get_all({isMe = false}) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    User user = await getUser();
    var req;
    if (isMe) {
      req = await client.get(
          Uri.parse(baseUrl + "order?driver=${user.username}"),
          headers: {'Authorization': 'JWT $token'});
    } else {
      req = await client.get(Uri.parse(baseUrl + "order?status=PENDING"),
          headers: {'Authorization': 'JWT $token'});
    }

    final data = jsonDecode(req.body);
    print("before $data");
    List<dynamic> items = data.map((json) => Order.fromMap(json)).toList();
    print("after $items");

    return items;
  }

  static Future get_one(int id) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var req = await client.get(Uri.parse(baseUrl + "order/" + id.toString()),
        headers: {'Authorization': 'JWT $token'});

    final data = jsonDecode(req.body);

    if (data != null) {
      Order orders = Order.fromJson(data);

      return orders;
    }
    return null;
  }

  static Future create(Order order) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    var new_order = order.toJson();
    var req = await client.post(Uri.parse(baseUrl + "order/"),
        headers: {'Authorization': 'JWT $token'}, body: new_order);

    final data = jsonDecode(req.body);

    if (data != null) {
      Item items = Item.fromJson(data);

      return items;
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

  static Future getSpecificUser(username) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    var req = await client.get(Uri.parse(baseUrlForAuth + "/auth/users/"),
        headers: {'Authorization': 'JWT $token'});

    final userData = jsonDecode(req.body);

    List<dynamic> users = userData.map((json) => User2.fromMap(json)).toList();
    int? id = null;
    users.forEach((element) {
      if (element.username == username) {
        id = element.id;
        return element.id;
      }
    });
    return id;

    // print("User here after $userData");
  }

  static Future update(Order order) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];

    User user = await getUser();
    print(user);

    order.driver = user;
    order.status = 'PENDING_SP';
    AcceptedOrder acceptedOrder =
        AcceptedOrder(id: order.id, driver: user.id, status: 'ACCEPTED');
    var new_order = acceptedOrder.toJson();
    var req = await client.patch(
        Uri.parse(baseUrl + "order/" + order.id.toString() + '/'),
        headers: {
          'Authorization': 'JWT $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: new_order);

    final data = jsonDecode(req.body);
    log('data' + data);

    if (data != null) {
      Order addresses = Order.fromMap(data);

      return addresses;
    }
    return null;
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

  static Future updateDriver(OrderAddress orderAddress) async {
    var client = http.Client();
    var token = (await AuthService.getToken())['token'];
    User user = await getUser();
    // var id = await getProfileID(user.username);

    print("IAM USER $user");
    var newProfile = Profile2(
            latt: orderAddress.latt.toString(),
            long: orderAddress.long.toString())
        .toJson();
    // var new_order = orderAddress.toJson();
    var req = await client.patch(
        Uri.parse(baseUrl + "profiles/" + user.username.toString() + '/'),
        headers: {
          'Authorization': 'JWT $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: newProfile);

    final data = jsonDecode(req.body);
    print("");
    print("IAM DATA $data");
    // if (data != null) {
    //   Profile addresses = Profile.fromMap(data);
    //   print(" MEEEEEEEEEEEEEEEEEEE r${addresses.long}:${addresses.latt}");

    //   return addresses;
    // }
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
