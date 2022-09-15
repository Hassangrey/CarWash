// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/Provider.dart';
import 'package:safacw/widgets/build_provider.dart';
import '../Constants/appBarCustomized.dart';
import '../services/provider_service.dart';
import '../widgets/SelectServiceText.dart';
import 'loadingscreen_page.dart';

class ChooseProvider extends StatelessWidget {
  static const String id = '/chooseproviderpage';

  const ChooseProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kappBarStyle(''),
      body: Padding(padding: const EdgeInsets.all(35.0), child: Container()),
    );
  }
}
