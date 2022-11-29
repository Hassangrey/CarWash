// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  String? real_name;
  String? long;
  String? latt;
  bool? status;
  String? phone;
  Profile({
    this.real_name,
    this.long,
    this.latt,
    this.status,
    this.phone,
  });

  Profile copyWith({
    String? real_name,
    String? long,
    String? latt,
    bool? status,
    String? phone,
  }) {
    return Profile(
      real_name: real_name ?? this.real_name,
      long: long ?? this.long,
      latt: latt ?? this.latt,
      status: status ?? this.status,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'real_name': real_name,
      'long': long,
      'latt': latt,
      'status': status,
      'phone': phone,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      real_name: map['real_name'] != null ? map['real_name'] as String : null,
      long: map['long'] != null ? map['long'] as String : null,
      latt: map['latt'] != null ? map['latt'] as String : null,
      status: map['status'] != null ? map['status'] as bool : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(real_name: $real_name, long: $long, latt: $latt, status: $status, phone: $phone)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.real_name == real_name &&
        other.long == long &&
        other.latt == latt &&
        other.status == status &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return real_name.hashCode ^
        long.hashCode ^
        latt.hashCode ^
        status.hashCode ^
        phone.hashCode;
  }
}
