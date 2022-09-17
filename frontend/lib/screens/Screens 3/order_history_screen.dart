import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';

// TODO 4: Display a list that shows all the previous orders( Will be fetched from the API)
// * And their state (Completed, pending, or canceled)

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);
  static const String id = 'OrdersHistoryScreen';

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Center(
          child: Text('Orders Screen', style: kServiceTitleStyle),
        )
      ]),
    );
  }
}
