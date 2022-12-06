// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class OrderCreate {
  String? id;
  List<String>? items;
  String? user;
  String? driver;
  String? service_provider;
  String? long;
  String? latt;
  String? status;
  String? price;
  String? date;
  OrderCreate({
    this.id,
    this.items,
    this.user,
    this.driver,
    this.service_provider,
    this.long,
    this.latt,
    this.status,
    this.price,
    this.date,
  });

  OrderCreate copyWith({
    String? id,
    List<String>? items,
    String? user,
    String? driver,
    String? service_provider,
    String? long,
    String? latt,
    String? status,
    String? price,
    String? date,
  }) {
    return OrderCreate(
      id: id ?? this.id,
      items: items ?? this.items,
      user: user ?? this.user,
      driver: driver ?? this.driver,
      service_provider: service_provider ?? this.service_provider,
      long: long ?? this.long,
      latt: latt ?? this.latt,
      status: status ?? this.status,
      price: price ?? this.price,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'items': items,
      'user': user,
      'driver': driver,
      'service_provider': service_provider,
      'long': long,
      'latt': latt,
      'status': status,
      'price': price,
      'date': date,
    };
  }

  factory OrderCreate.fromMap(Map<String, dynamic> map) {
    return OrderCreate(
      id: map['id'] != null ? map['id'] as String : null,
      items: map['items'] != null
          ? List<String>.from((map['items'] as List<String>))
          : null,
      user: map['user'] != null ? map['user'] as String : null,
      driver: map['driver'] != null ? map['driver'] as String : null,
      service_provider: map['service_provider'] != null
          ? map['service_provider'] as String
          : null,
      long: map['long'] != null ? map['long'] as String : null,
      latt: map['latt'] != null ? map['latt'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderCreate.fromJson(String source) =>
      OrderCreate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderCreate(id: $id, items: $items, user: $user, driver: $driver, service_provider: $service_provider, long: $long, latt: $latt, status: $status, price: $price, date: $date)';
  }

  @override
  bool operator ==(covariant OrderCreate other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        listEquals(other.items, items) &&
        other.user == user &&
        other.driver == driver &&
        other.service_provider == service_provider &&
        other.long == long &&
        other.latt == latt &&
        other.status == status &&
        other.price == price &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        items.hashCode ^
        user.hashCode ^
        driver.hashCode ^
        service_provider.hashCode ^
        long.hashCode ^
        latt.hashCode ^
        status.hashCode ^
        price.hashCode ^
        date.hashCode;
  }
}
