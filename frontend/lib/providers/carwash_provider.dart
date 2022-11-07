import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:safacw/Models/CarWash.dart';
import 'package:safacw/models/Item.dart';
import 'package:safacw/services/service_providers_service.dart';

class CarWashProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  List<dynamic> carWashProvidersProfilers = [];
  String type = '';
  List<Item> myItems = [
    Item(
        id: 1,
        title: 'T Shirt',
        price: 12,
        desc: 'hhhh',
        imgPath: 'https://i.ebayimg.com/images/g/aMcAAOSwIL5iMLPb/s-l500.png'),
    Item(
        id: 2,
        title: 'Thobe',
        price: 14,
        desc: 'hhhh',
        imgPath:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBdf5O3NfFcE1CSY9UHSFb7ycnuY-lkRdME3AQqor5zImIJQIG2EEft1nKup_M_W4T-30&usqp=CAU'),
    Item(
        id: 3,
        title: 'Cargo Pants',
        price: 30,
        desc: 'hhhh',
        imgPath:
            'https://prod.haglofs-excite.com/assets/blobs/6045442C5_ST_NM_FR_1_W1_DWB-ba211e611d.jpeg?preset=tiny&dpr=2'),
    Item(
        id: 4,
        title: 'Black Shirt',
        price: 30,
        desc: 'hhhh',
        imgPath:
            'https://www.picng.com/upload/dress_shirt/png_dress_shirt_26350.png'),
  ];
  List<Item> cartItems = [];
  getAllCarWashProvidersProfilers(String type) async {
    isLoading = true;
    print('Loading data...');
    type = type;
    carWashProvidersProfilers =
        (await ProviderService.getProvidersProfile(type));
    isLoading = false;
    print(carWashProvidersProfilers.length);
    notifyListeners();
  }

  addItem(int id) {
    for (int i = 0; i < myItems.length; i++) {
      if (myItems[i].id == id) cartItems.add(myItems[i]);
    }
  }

  removeItem(int id) {
    for (int i = 0; i < cartItems.length; i++)
      if (cartItems[i].id == id) cartItems.removeAt(i);
    notifyListeners();
  }

  clearItems() => cartItems.clear();
}
