
class Item {
   String title;
   double price;
   String imgPath;
   String desc;

  Item({
    required this.title,
    required this.price,
    required this.imgPath,
    required this.desc,
  });

  String get getTitle {
    return title;
  }
  void setTitle(String value) {
    title = value;
  }

   double get getPrice {
     return price;
   }
   void setPrice(double value) {
     price = value;
   }

   String get getPath{
    return imgPath;
   }
   String get getDesc{
     return desc;
   }
}
