// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User2 {
  int? id;
  String? username;
  String? email;
  User2({
    this.id,
    this.username,
    this.email,
  });

  User2 copyWith({
    int? id,
    String? username,
    String? email,
  }) {
    return User2(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
    };
  }

  factory User2.fromMap(Map<String, dynamic> map) {
    return User2(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User2.fromJson(String source) =>
      User2.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User2(id: $id, username: $username, email: $email)';

  @override
  bool operator ==(covariant User2 other) {
    if (identical(this, other)) return true;

    return other.id == id && other.username == username && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ email.hashCode;
}
