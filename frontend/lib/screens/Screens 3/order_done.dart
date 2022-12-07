import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/screens/Screens%203/cart_screen.dart';
import 'package:safacw/screens/bottom_navigation_bar_holder.dart';
import 'package:safacw/screens/choose_provider_screen.dart';
import 'package:safacw/screens/choose_service_screen.dart';
import 'package:safacw/widgets/page_layout.dart';

class OrderDoneScreen extends StatelessWidget {
  static const String id = '/OrderDoneScreen';

  const OrderDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          const Text(
            'Waiting for the service provider to accept',
            style: kItemNameStyle,
          ),
          const Spacer(),
          MyCustomButton(
            title: 'Go Back Home',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, NavBarHolder.id, (route) => false);
            },
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
