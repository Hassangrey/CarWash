import 'package:flutter/material.dart';
import '../Constants/Constants.dart';

class HeaderWithSearchBar extends StatelessWidget {
  const HeaderWithSearchBar({Key? key, required this.providerName}) : super(key: key);
  final String providerName;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.2,
      child: Stack(
        children: [
          Container(
            height: screenSize.height*0.2 - 27,
            decoration: BoxDecoration(
              color: Color(0xFF46B4E7,),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 35, 35),
              child: Row(
                children: [
                  Text(
                    providerName,
                    style: kServiceTitleStyle,
                  ),
                  Spacer(),

                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 25),
              child: Container(
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.blueAccent.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                        ),
                      )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
