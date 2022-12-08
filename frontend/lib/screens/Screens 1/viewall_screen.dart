import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/screens/Screens%201/laundry_main_screen.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/widgets/snackbar_widget.dart';

class ViewAllScreen extends StatelessWidget {
  static const String id = '/ViewAllScreen';
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            ServicesList(),
          ],
        ),
      ),
    );
  }
}

class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CarWashProvider>(context);
    List<dynamic> items = provider.items;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
                primary: false,
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 30,
                children: List.generate(items.length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            width: 150.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                                color: COLOR_GREY.withOpacity(0.09),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Image.network(items[index].imgPath!)),
                      ),
                      Text(items[index],
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: COLOR_BLUE_DARK)),
                      Text('SAR12',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: COLOR_BLUE_LIGHT),
                              onPressed: () {
                                showActionSnackBar(
                                    context, '${items[index]} added to cart!');
                              },
                              child: const Text('Add To Cart')))
                    ],
                  );
                })),
          ),
        ],
      ),
    );
  }
}
