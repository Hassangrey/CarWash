import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key, required this.imgPath, required this.onPress}) : super(key: key);
  final String imgPath;
  final Function() onPress;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext ctx, int index) {
            return GestureDetector(
              onTap: onPress,
              child: Container(
                color: Color(0xFFE6CDB6),
                height: 150,
                margin: EdgeInsets.all(20),
                child: Positioned.fill(
                  child: Image.asset('images/CarWash.png',
                    fit: BoxFit.contain,

                  ),
                ),

              ),
            );
          }

      ),

    );
  }
}
