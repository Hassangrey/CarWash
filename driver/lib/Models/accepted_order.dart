// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AcceptedOrder {
  int? id;
  int? driver;
  String? status;
  AcceptedOrder({
    this.id,
    this.driver,
    this.status,
  });

  AcceptedOrder copyWith({
    int? id,
    int? driver,
    String? status,
  }) {
    return AcceptedOrder(
      id: id ?? this.id,
      driver: driver ?? this.driver,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'driver': driver,
      'status': status,
    };
  }

  factory AcceptedOrder.fromMap(Map<String, dynamic> map) {
    return AcceptedOrder(
      id: map['id'] != null ? map['id'] as int : null,
      driver: map['driver'] != null ? map['driver'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcceptedOrder.fromJson(String source) =>
      AcceptedOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AcceptedOrder(id: $id, driver: $driver, status: $status)';

  @override
  bool operator ==(covariant AcceptedOrder other) {
    if (identical(this, other)) return true;

    return other.id == id && other.driver == driver && other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ driver.hashCode ^ status.hashCode;
}
