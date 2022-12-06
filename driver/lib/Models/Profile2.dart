// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile2 {
  String? long;
  String? latt;
  Profile2({
    this.long,
    this.latt,
  });

  Profile2 copyWith({
    String? long,
    String? latt,
  }) {
    return Profile2(
      long: long ?? this.long,
      latt: latt ?? this.latt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'long': long,
      'latt': latt,
    };
  }

  factory Profile2.fromMap(Map<String, dynamic> map) {
    return Profile2(
      long: map['long'] != null ? map['long'] as String : null,
      latt: map['latt'] != null ? map['latt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile2.fromJson(String source) =>
      Profile2.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Profile2(long: $long, latt: $latt)';

  @override
  bool operator ==(covariant Profile2 other) {
    if (identical(this, other)) return true;

    return other.long == long && other.latt == latt;
  }

  @override
  int get hashCode => long.hashCode ^ latt.hashCode;
}
