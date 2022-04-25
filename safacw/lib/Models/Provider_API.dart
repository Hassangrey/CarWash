class Provider_API {
  int? id;
  String? user;

  Provider_API({
    this.id,
    this.user,
  });

 
  Provider_API.fromJsonMap(Map map) {
    id = map['id'];
    user = map['user'];
  }
  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;

    return data;
  }
}
