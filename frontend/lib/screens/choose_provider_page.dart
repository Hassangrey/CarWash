// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseProvider extends StatelessWidget {
  static const String id = '/chooseproviderpage';

  const ChooseProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var carProvider = Provider.of<CarWashProvider>(context);
    return PageLayout(
        child: carProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: carProvider.carWashProvidersProfilers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(carProvider.carWashProvidersProfilers[index]
                          ['user']));
                },
              ));
  }
}
