import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.desc}) : super(key: key);
 final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        desc,
        textAlign: TextAlign.justify,
        style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
      ),
        padding: EdgeInsets.all(16)

    );
  }
}
