class Order {
  int? id;
  String? name;
  double? price;

  Order({
    this.id,
    this.name,
    this.price,
  });

 
  Order.fromJsonMap(Map map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
  }
  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;

    return data;
  }
}
