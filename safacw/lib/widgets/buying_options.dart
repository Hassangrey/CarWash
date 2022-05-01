import 'package:flutter/material.dart';

class BuyingOptions extends StatefulWidget {
  const BuyingOptions({Key? key}) : super(key: key);

  @override
  State<BuyingOptions> createState() => _BuyingOptionsState();
}

class _BuyingOptionsState extends State<BuyingOptions> {
  var selectedValue = 0;



  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        RadioListTile<int>(
          value: 0,
          groupValue: selectedValue,
          title: Text('Both'),
          subtitle: Text('\$0.00'),
          onChanged: (value) => setState(() => selectedValue = value!),
        ),
        RadioListTile<int>(
          value: 1,
          groupValue: selectedValue,
          title: Text('Interior Only'),
          subtitle: Text('\$0.00'),
          onChanged: (value) => setState(() => selectedValue = value!),
        ),
        RadioListTile<int>(
          value: 2,
          groupValue: selectedValue,
          title: Text('Exterior Only'),
          subtitle: Text('\$0.00'),
          onChanged: (value) => setState(() => selectedValue = value!),
        ),

      ],
    );
  }
}
