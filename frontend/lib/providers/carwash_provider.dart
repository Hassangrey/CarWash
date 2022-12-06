import 'package:flutter/material.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/Order.dart';
import 'package:safacw/Models/order_create.dart';
import 'package:safacw/services/item_service.dart';
import 'package:safacw/services/order_service.dart';
import 'package:safacw/services/service_providers_service.dart';

class CarWashProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  List<dynamic> carWashProvidersProfilers = [];
  String type = '';
  List<Item> cartItems = [];
  List<dynamic> items = [];
  List<dynamic> ordersHistory = [];
  double total = 0.0;
  String address = "";
  int? selectedOrder;
  Order? selectedOrder2;
  dynamic? selectedSP;
  dynamic? me;

  getMe() async {
    me = await OrderService.getUser();
    notifyListeners();
  }

  // * The Order objects
  String x = ''; // Here the lat will be saved
  String y = ''; // Here the long will be saved
  String providerId = ''; // Here the chosen laundy ID will be saved
  // * End of Order Object

  getAllCarWashProvidersProfilers(String type) async {
    isLoading = true;
    print('Loading data...');
    type = type;
    carWashProvidersProfilers =
        (await ProviderService.getProvidersProfile(type));
    isLoading = false;
    notifyListeners();
  }

  getItems(String name) async {
    isLoading = true;
    print('Loading items...');
    type = type;
    items = (await ItemService.get_items_provider(name));
    print(items.length);
    isLoading = false;
    notifyListeners();
  }

  getAllOrdersHistory() async {
    isLoading = true;
    // print('Loading data...');
    ordersHistory = (await OrderService.get_all());
    isLoading = false;
    notifyListeners();
  }

  addItem(int id) {
    List<Item> items = [];
    if (type == "Laundry") {
      items = myItems;
    } else if (type == "CarWash") {
      items = carWashItems;
    } else {
      items = buildingCleaningItems;
    }
    for (int i = 0; i < items.length; i++) {
      if (items[i].id == id) {
        cartItems.add(items[i]);
        total += double.parse(items[i].price!);
        break;
      }
    }

    notifyListeners();
  }

  removeItem(int id) {
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id == id) {
        if (total - double.parse(cartItems[0].price!) < 0)
          total = 0;
        else {
          total -= double.parse(cartItems[i].price!);
        }
        cartItems.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }

  List<String> returnItemIds() {
    List<String> itemIds = [];
    for (int i = 0; i < cartItems.length; i++) {
      itemIds.add(cartItems[i].id.toString());
    }
    return itemIds;
  }

  void createOrder() async {
    var order = OrderCreate(
      items: returnItemIds(),
      service_provider: selectedSP.id.toString(),
      price: total.toString(),
    );
    await OrderService.create(order, selectedSP, x, y);
  }

  void selectedSPMethod(SP) {
    selectedSP = SP;
    notifyListeners();
  }

  void getLocation(String lat, String long) {
    if (lat.isNotEmpty && long.isNotEmpty) {
      x = lat;
      y = long;
    }
    print('Your lat is: $x and your long is: $y');
  }

  bool noAddressSelected() {
    return (x == '' && y == '');
  }

  String getTaxes() => (total * 0.15).toStringAsFixed(2);
  String getTotal() => (total + 12).toStringAsFixed(0);

  clearItems() {
    cartItems.clear();
    total = 0;
    address = '';
  }

  getOrder0(id) async {
    print('Loading data...');

    selectedOrder = id;
    notifyListeners();
  }

  getOrder(id) async {
    print('Loading data...');

    this.selectedOrder2 = (await OrderService.get_one(id + 1));
    notifyListeners();
  }

  List<Item> myItems = [
    Item(
        id: 1,
        title: 'T-Shirt',
        price: "14",
        desc: 'hhhh',
        imgPath: 'https://i.ebayimg.com/images/g/aMcAAOSwIL5iMLPb/s-l500.png'),
    Item(
        id: 2,
        title: 'Thobe',
        price: "14",
        desc: 'hhhh',
        imgPath:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBdf5O3NfFcE1CSY9UHSFb7ycnuY-lkRdME3AQqor5zImIJQIG2EEft1nKup_M_W4T-30&usqp=CAU'),
    Item(
        id: 3,
        title: 'Cargo Pants',
        price: "30",
        desc: 'hhhh',
        imgPath:
            'https://prod.haglofs-excite.com/assets/blobs/6045442C5_ST_NM_FR_1_W1_DWB-ba211e611d.jpeg?preset=tiny&dpr=2'),
    Item(
        id: 4,
        title: 'Black Shirt',
        price: "30",
        desc: 'hhhh',
        imgPath:
            'https://www.picng.com/upload/dress_shirt/png_dress_shirt_26350.png'),
  ];

  List<Item> carWashItems = [
    Item(
        id: 1,
        title: 'Small Car (Only IN wash)',
        price: "15",
        desc: 'hhhh',
        imgPath: 'https://static.thenounproject.com/png/2714848-200.png'),
    Item(
        id: 2,
        title: 'Small Car (Only OUT wash)',
        price: "25",
        desc: 'hhhh',
        imgPath:
            'https://cdn4.vectorstock.com/i/thumb-large/81/03/car-washer-black-glyph-icon-vector-34538103.jpg'),
  ];

  List<Item> buildingCleaningItems = [
    Item(
        id: 1,
        title: 'Building',
        price: "12",
        desc: 'hhhh',
        imgPath: 'https://i.ebayimg.com/images/g/aMcAAOSwIL5iMLPb/s-l500.png'),
    Item(
        id: 2,
        title: 'Thobe',
        price: "14",
        desc: 'hhhh',
        imgPath:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBdf5O3NfFcE1CSY9UHSFb7ycnuY-lkRdME3AQqor5zImIJQIG2EEft1nKup_M_W4T-30&usqp=CAU'),
    Item(
        id: 3,
        title: 'Cargo Pants',
        price: "30",
        desc: 'hhhh',
        imgPath:
            'https://prod.haglofs-excite.com/assets/blobs/6045442C5_ST_NM_FR_1_W1_DWB-ba211e611d.jpeg?preset=tiny&dpr=2'),
    Item(
        id: 4,
        title: 'Black Shirt',
        price: "30",
        desc: 'hhhh',
        imgPath:
            'https://www.picng.com/upload/dress_shirt/png_dress_shirt_26350.png'),
  ];
}
