import 'package:flutter/material.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/Order.dart';
import 'package:safacw/Models/OrderComp.dart';
import 'package:safacw/Models/order_address.dart';
import 'package:safacw/services/item_service.dart';
import 'package:safacw/services/order_service.dart';

class DriverProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  List<dynamic> orders = [];
  List<dynamic> ordersHistory = [];

  int? selectedOrder;
  dynamic? me;
  getMe() async {
    isLoading = true;

    me = await OrderService.getUser();
    me.profile = await OrderService.getProfile(me.username);
    isLoading = false;

    notifyListeners();
  }

  getAllOrders() async {
    isLoading = true;
    // print('Loading data...');
    orders = (await OrderService.get_all());
    isLoading = false;
    notifyListeners();
  }

  getAllOrdersHistory() async {
    isLoading = true;
    // print('Loading data...');
    ordersHistory = (await OrderService.get_all(isMe: true));
    isLoading = false;
    notifyListeners();
  }

  updateOrder({index}) async {
    isLoading = true;
    // print('Loading data...');

    (await OrderService.update(orders[index]));
    this.selectedOrder = index;
    isLoading = false;
    notifyListeners();
  }

  updateOrderAddress(OrderAddress orderAddress) async {
    print('Loading data...');
    orderAddress.id = orders[this.selectedOrder!].id;

    (await OrderService.updateDriver(orderAddress));

    notifyListeners();
  }

  completeOrder(Order order) async {
    print('Loading data...');
    order.id = orders[this.selectedOrder!].id;
    var x = OrderComp(id: orders[this.selectedOrder!].id, status: "COMPLETED");

    (await OrderService.completeOrder(x));

    notifyListeners();
  }
}
