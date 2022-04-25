class ProviderAPI {
  int? id;
  String? user;

  ProviderAPI({
    this.id,
    this.user,
  });

 
  ProviderAPI.fromJsonMap(Map map) {
    id = map['id'];
    user = map['user'];
  }

  String get name => this.name;
  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;

    return data;
  }
}
