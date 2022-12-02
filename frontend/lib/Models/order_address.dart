// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderAddress {
  int? id;

  double? long;
  double? latt;
  OrderAddress({
    this.id,
    this.long,
    this.latt,
  });

  OrderAddress copyWith({
    int? id,
    double? long,
    double? latt,
  }) {
    return OrderAddress(
      id: id ?? this.id,
      long: long ?? this.long,
      latt: latt ?? this.latt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'long': long,
      'latt': latt,
    };
  }

  factory OrderAddress.fromMap(Map<String, dynamic> map) {
    return OrderAddress(
      id: map['id'] != null ? map['id'] as int : null,
      long: map['long'] != null ? map['long'] as double : null,
      latt: map['latt'] != null ? map['latt'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderAddress.fromJson(String source) =>
      OrderAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderAddress(id: $id, long: $long, latt: $latt)';

  @override
  bool operator ==(covariant OrderAddress other) {
    if (identical(this, other)) return true;

    return other.id == id && other.long == long && other.latt == latt;
  }

  @override
  int get hashCode => id.hashCode ^ long.hashCode ^ latt.hashCode;
}
