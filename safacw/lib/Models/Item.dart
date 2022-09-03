class Item {
  int? id;

  String? title;
  double? price;
  String? imgPath;
  String? desc;

  Item({
    this.id,

    this.title,
    this.price,
    this.imgPath,
    this.desc,
  });



  void setTitle(String value) {
    title = value;
  }


  void setPrice(double value) {
    price = value;
  }

  String get getPath {
    return imgPath!;
  }

  String get getDesc {
    return desc!;
  }

  Item.fromJsonMap(Map map) {
    id = map['id'];

    title = map['name'];
    price = map['in_price'];
    imgPath = map['imgPath'];
    desc = map['desc'];
  }
  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.title;
    data['in_price'] = this.price;
    data['imgPath'] = this.imgPath;
    data['desc'] = this.desc;

    return data;
  }
}
