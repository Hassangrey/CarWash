import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
List<String> categories = ['Cars', 'Trucks', 'Buses'];
int startingIndex = 0;
int itemCount = 0;

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
          itemBuilder: (context, index) => buildCaregory(index),
              ),
    );
  }
}
  Widget buildCaregory(int index) {
  return GestureDetector(
    onTap: () {

    },
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categories[index],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20 / 4),
            height: 2,
            width: 30,
            color: Colors.black,

          ),
        ],
      ),
    ),
  );
  }
