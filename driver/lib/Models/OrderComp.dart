// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderComp {
  int? id;
  String? status;
  OrderComp({
    this.id,
    this.status,
  });

  OrderComp copyWith({
    int? id,
    String? status,
  }) {
    return OrderComp(
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
    };
  }

  factory OrderComp.fromMap(Map<String, dynamic> map) {
    return OrderComp(
      id: map['id'] != null ? map['id'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderComp.fromJson(String source) =>
      OrderComp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderComp(id: $id, status: $status)';

  @override
  bool operator ==(covariant OrderComp other) {
    if (identical(this, other)) return true;

    return other.id == id && other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ status.hashCode;
}
