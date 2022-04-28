import 'package:flutter/material.dart';

class BuyingOptions extends StatelessWidget {
  const BuyingOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Colors.blueGrey),

              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Internal'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('External'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Both'),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
