import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:safacw/Models/CarWash.dart';
import 'package:safacw/services/service_providers_service.dart';

class CarWashProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  List<dynamic> carWashProvidersProfilers = [];
  String type = '';


  getAllCarWashProvidersProfilers(String type) async {
    isLoading = true;
    carWashProvidersProfilers = (await ProviderService.getProvidersProfile(type));
    isLoading = false;
    notifyListeners();
  }
    changeType(String type) async {
      type=type;
    notifyListeners();
  }
}
