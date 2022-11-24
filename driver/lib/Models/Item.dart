// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  int? id;

  String? title;
  String? price;
  String? imgPath;
  String? desc;
  Item({
    this.id,
    this.title,
    this.price,
    this.imgPath,
    this.desc,
  });

  Item copyWith({
    int? id,
    String? title,
    String? price,
    String? imgPath,
    String? desc,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      imgPath: imgPath ?? this.imgPath,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'imgPath': imgPath,
      'desc': desc,
    };
  }

  factory Item.fromMap(Map map) {
    return Item(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      imgPath: map['imgPath'] != null ? map['imgPath'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, title: $title, price: $price, imgPath: $imgPath, desc: $desc)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.imgPath == imgPath &&
        other.desc == desc;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        imgPath.hashCode ^
        desc.hashCode;
  }
}
