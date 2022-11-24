import 'package:flutter/material.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/Order.dart';
import 'package:safacw/services/item_service.dart';
import 'package:safacw/services/order_service.dart';

class DriverProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  List<dynamic> orders = [];

  getAllOrders() async {
    isLoading = true;
    print('Loading data...');
    orders = (await OrderService.get_all());
    isLoading = false;
    notifyListeners();
  }
}
