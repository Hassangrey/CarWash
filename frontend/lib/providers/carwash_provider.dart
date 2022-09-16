import 'package:flutter/material.dart';
import 'package:safacw/services/service_providers_service.dart';

class CarWashProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  List<dynamic> carWashProvidersProfilers = [];

  getAllCarWashProvidersProfilers() async {
    isLoading = true;
    carWashProvidersProfilers = (await ProviderService.getProvidersProfile());
    isLoading = false;
    notifyListeners();
  }
}
