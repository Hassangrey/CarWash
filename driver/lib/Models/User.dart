class User {
  int? id;
  String? username;
  String? email;

  User({
    this.id,
    this.username,
    this.email,
  });

 
  User.fromJsonMap(Map map) {
    id = map['id'];
    username = map['username'];
    email = map['email'];
  }
  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;

    return data;
  }
}
