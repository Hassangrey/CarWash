import 'User.dart';

class Address {
  int? id;
  User? user;
  double? lat;
  double? long;

  Address({
    this.id,
    this.user,
    this.lat,
    this.long,
  });

 
  Address.fromJsonMap(Map map) {
    id = map['id'];
    user = map['user'];
    lat = map['lat'];
    long = map['long'];
  }
  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['lat'] = this.lat;
    data['long'] = this.long;

    return data;
  }
}
