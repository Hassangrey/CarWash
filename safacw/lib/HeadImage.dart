import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key, required this.imgPath}) : super(key: key);
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imgPath,
          scale: (0.5),
        ),
        SizedBox(height: 50,),
      ],
    );
  }
}
