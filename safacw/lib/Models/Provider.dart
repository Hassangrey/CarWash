import 'Item.dart';

class Provider {
  String name;
  int id;
  String desc;
  String imgPath;
  List<Item> items;

  Provider({
    required this.name,
    required this.id,
    required this.imgPath,
    required this.items,
    required this.desc,
  });

  String get getName {
    return name;
  }

  void setName(String newName) {
    name = newName;
  }

  int get getId {
    return id;
  }
  String get getDesc {
    return desc;
  }

  String get getImgPath {
    return imgPath;
  }
  void setImgPath(String newImagePath) {
    imgPath = newImagePath;
  }

}
