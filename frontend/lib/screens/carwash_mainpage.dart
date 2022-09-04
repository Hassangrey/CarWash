import 'package:flutter/material.dart';
import 'package:safacw/Models/language_constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarWashMain extends StatelessWidget {
  static const String id = '/carwashpage';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return PageLayout(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(translation(context).welcome_title)]),
    );
  }
}
