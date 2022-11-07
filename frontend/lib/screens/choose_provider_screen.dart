// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/addspace_functions.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/screens/carwash_main_screen.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseProvider extends StatelessWidget {
  static const String id = '/chooseproviderpage';
  const ChooseProvider({Key? key}) : super(key: key);

  void getItems(BuildContext context, String name) async {
    var provider = Provider.of<CarWashProvider>(context, listen: false);
    Navigator.pushNamed(context, provider.type);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CarWashProvider>(context);

    return PageLayout(
        child: provider.isLoading
            ? Center(child: CircularProgressIndicator())
            : MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: provider.carWashProvidersProfilers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => getItems(
                          context, provider.carWashProvidersProfilers[0].name),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15.r)),
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 16.h),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 56.h,
                              width: 60.w,
                              margin: EdgeInsets.all(8),
                              color: COLOR_GREY,
                            ),
                            addHorizontalSpace(4.w),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        provider
                                            .carWashProvidersProfilers[index]
                                            .name,
                                        style: const TextStyle(
                                            color: COLOR_BLUE_DARK,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      addHorizontalSpace(70.w),
                                    ],
                                  ),
                                  Text('A very good laundry!'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return addVerticalSpace(10.h);
                  },
                ),
              ));
  }
}
