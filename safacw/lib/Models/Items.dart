
class Items {
   String title;
   double price;
   String imgPath;


  Items({
    required this.title,
    required this.price,
    required this.imgPath,
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
}
