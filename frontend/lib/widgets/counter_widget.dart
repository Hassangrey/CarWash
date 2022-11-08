import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemCounterWidget extends StatefulWidget {
  const ItemCounterWidget({Key? key}) : super(key: key);

  @override
  State<ItemCounterWidget> createState() => _ItemCounterWidgetState();
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.grey[500]),
          child: Text('+'),
        ),
        Text('1'),
        Container(
          width: 20,
          height: 20,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.grey[500]),
          child: Text('+'),
        ),
      ],
    );
  }
}
