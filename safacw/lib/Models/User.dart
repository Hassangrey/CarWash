class Address {
  int? id;
  double? username;
  double? email;

  Address({
    this.id,
    this.username,
    this.email,
  });

 
  Address.fromJsonMap(Map map) {
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
