import 'package:flutter/material.dart';

import 'HeadImage.dart';

class DetailPageHeader extends StatelessWidget {
  const DetailPageHeader({Key? key, required this.imgPath}) : super(key: key);
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: HeaderImage( imgPath: imgPath,),

    );
  }
}
