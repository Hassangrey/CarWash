// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/User.dart';

class Order {
  int? id;
  List<Item>? items;
  User? user;
  User? driver;
  User? service_provider;

  String? long;
  String? latt;
  Order({
    this.id,
    this.items,
    this.user,
    this.driver,
    this.service_provider,
    this.long,
    this.latt,
  });

  Order copyWith({
    int? id,
    List<Item>? items,
    User? user,
    User? driver,
    User? service_provider,
    String? long,
    String? latt,
  }) {
    return Order(
      id: id ?? this.id,
      items: items ?? this.items,
      user: user ?? this.user,
      driver: driver ?? this.driver,
      service_provider: service_provider ?? this.service_provider,
      long: long ?? this.long,
      latt: latt ?? this.latt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'items': items?.map((x) => x?.toMap()).toList(),
      'user': user?.toMap(),
      'driver': driver?.toMap(),
      'service_provider': service_provider?.toMap(),
      'long': long,
      'latt': latt,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] != null ? map['id'] as int : null,
      items: map['items'] != null
          ? List<Item>.from(
              (map['items'] as List<dynamic>).map<Item?>(
                (x) => Item.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      driver: map['driver'] != null
          ? User.fromMap(map['driver'] as Map<String, dynamic>)
          : null,
      service_provider: map['service_provider'] != null
          ? User.fromMap(map['service_provider'] as Map<String, dynamic>)
          : null,
      long: map['long'] != null ? map['long'] as String : null,
      latt: map['latt'] != null ? map['latt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(id: $id, items: $items, user: $user, driver: $driver, service_provider: $service_provider, long: $long, latt: $latt)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        listEquals(other.items, items) &&
        other.user == user &&
        other.driver == driver &&
        other.service_provider == service_provider &&
        other.long == long &&
        other.latt == latt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        items.hashCode ^
        user.hashCode ^
        driver.hashCode ^
        service_provider.hashCode ^
        long.hashCode ^
        latt.hashCode;
  }
}
