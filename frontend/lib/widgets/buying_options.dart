import 'package:flutter/material.dart';

class BuyingOptions extends StatefulWidget {
  const BuyingOptions({Key? key, required this.bothPrice, required this.interiorPrice, required this.exteriorPrice}) : super(key: key);
  final String bothPrice;
  final String interiorPrice;
  final String exteriorPrice;

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
          subtitle: Text('\$' + widget.bothPrice),
          onChanged: (value) => setState(() => selectedValue = value!),
        ),
        RadioListTile<int>(
          value: 1,
          groupValue: selectedValue,
          title: Text('Interior Only'),
          subtitle: Text('\$' + widget.interiorPrice),
          onChanged: (value) => setState(() => selectedValue = value!),
        ),
        RadioListTile<int>(
          value: 2,
          groupValue: selectedValue,
          title: Text('Exterior Only'),
          subtitle: Text('\$' + widget.exteriorPrice),
          onChanged: (value) => setState(() => selectedValue = value!),
        ),

      ],
    );
  }
}
