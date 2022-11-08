import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/addspace_functions.dart';
import 'package:safacw/widgets/counter_widget.dart';
import 'package:safacw/widgets/snackbar_widget.dart';

import '../providers/carwash_provider.dart';

Future<dynamic> MethodForDialog(BuildContext context, int index) async {
  var provider = Provider.of<CarWashProvider>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
              type: MaterialType.transparency,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Text(
                          'X',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500]),
                        )),
                    const Divider(),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(provider.myItems[index].imgPath!),
                        backgroundColor: Colors.grey[400],
                        radius: 30,
                      ),
                      title: Text(provider.myItems[index].title!),
                      subtitle: Text(
                          'SAR' + provider.myItems[index].price.toString()),
                      //  trailing: ItemCounterWidget(),
                    ),
                    TextField(
                      maxLines: 5,
                      minLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Any specific notes? (OPTIONAL)',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: COLOR_BLUE_LIGHT, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: COLOR_BLUE_DARK, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    addVerticalSpace(20.h),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: COLOR_BLUE_LIGHT,
                              shape: StadiumBorder(),
                            ),
                            onPressed: () {
                              provider.addItem(provider.myItems[index].id!);
                              showActionSnackBar(context,
                                  '${provider.myItems[index].title} added to cart! ${provider.cartItems.length}x');
                              Navigator.pop(context);
                            },
                            child: const Text('Add To Cart')))
                  ],
                ),
              )),
        );
      });
}
