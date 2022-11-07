import 'Item.dart';

class CarWash {
  String? name;
  int? id;
  String? desc;
  String? imgPath;
  List<Item>? items;

  CarWash({
    this.id,
    this.name,
    this.imgPath,
    this.items,
    this.desc,
  });

  String get getName {
    return name!;
  }

  void setName(String newName) {
    name = newName;
  }

  int get getId {
    return id!;
  }

  String get getDesc {
    return desc!;
  }

  String get getImgPath {
    return imgPath!;
  }

  void setImgPath(String newImagePath) {
    imgPath = newImagePath;
  }

  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.name;
    data['description'] = this.desc;
    data['photo'] = this.imgPath;
    data['items'] = this.items;

    return data;
  }

  CarWash.fromJsonMap(Map map) {
    id = map['id'];
    name = map['user'];
    desc = map['description'];
    imgPath = map['photo'];
    items = map['items'];
  }
}
