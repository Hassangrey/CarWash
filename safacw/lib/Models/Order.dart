import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Item.dart';

class Order {
  int? id;
  String? name;
  List<Item>? items = [];
  

  Order({
    this.id,
    this.name,
     this.items,
  });

 
  Order.fromJsonMap(Map map) {
    id = map['id'];
    name = map['name'];
    items = map['items'];
  }
  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['items'] = this.items;

    return data;
  }
}
