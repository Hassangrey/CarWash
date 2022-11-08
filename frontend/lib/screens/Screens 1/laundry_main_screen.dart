import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Models/language_constants.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/screens/Screens%201/viewall_screen.dart';
import 'package:safacw/widgets/dialog_method.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:safacw/widgets/snackbar_widget.dart';

import '../../Constants/addspace_functions.dart';

// TODO 1: Make laundry page the contains a title, list of offers
// * Display List of items that the provider got

class LaundryMainScreen extends StatelessWidget {
  static const String id = '/LaundryScreen';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return PageLayout(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translation(context).offers_title,
                style: (kServiceTitleStyle),
              ),
              addVerticalSpace(18.h),
              OffersList(),
              addVerticalSpace(12.h), //  CategoriesList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translation(context).services_title,
                    style: (kServiceTitleStyle),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, ViewAllScreen.id),
                    child: Text(translation(context).viewall_title,
                        style: const TextStyle(
                            color: COLOR_BLUE_DARK,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              addVerticalSpace(18.h),
              ServicesList(),
              // addVerticalSpace(50.h),
            ],
          ),
        ),
      ),
    );
  }
}

class OffersList extends StatelessWidget {
  final List Offerss = ['50% today!', 'Free delivery!', 't3'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: MediaQuery.removeViewPadding(
        removeBottom: true,
        removeTop: true,
        removeLeft: true,
        removeRight: true,
        context: context,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: Offerss.length,
          itemBuilder: (context, index) {
            return Column(children: [
              SizedBox(
                width: 150.w,
                height: 200.h,
                child: Column(
                  children: [
                    Image.network(
                        'https://www.rd.com/wp-content/uploads/2021/09/GettyImages-1181334518-MLedit.jpg'),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: COLOR_GREY.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.r)),
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Offerss[index],
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w600),
                            ),
                            Text('SAR50',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.red.withOpacity(0.6)))
                          ],
                        ))
                  ],
                ),
              )
            ]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return addHorizontalSpace(10.w);
          },
        ),
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  final List CatAss = ['T shirt', 'Thobe', 'Pants', 'Shirt'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: MediaQuery.removeViewPadding(
        removeBottom: true,
        removeTop: true,
        removeLeft: true,
        removeRight: true,
        context: context,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: CatAss.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 150.w,
              height: 150.h,
              child: Column(children: [
                //  Image.network(CatPic[index]),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(CatAss[index],
                        style: const TextStyle(fontSize: 15)))
              ]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return addHorizontalSpace(10.w);
          },
        ),
      ),
    );
  }
}

class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var carProvider = Provider.of<CarWashProvider>(context);

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Catagories(),
          const Divider(),
          SizedBox(
            height: 300.h,
            child: GridView.count(
                primary: false,
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 30,
                children: List.generate(carProvider.myItems.length, (index) {
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
                            child: Image.network(
                                carProvider.myItems[index].imgPath!)),
                      ),
                      Text(carProvider.myItems[index].title!,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: COLOR_BLUE_DARK)),
                      Text('SAR' + carProvider.myItems[index].price.toString(),
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: COLOR_BLUE_LIGHT),
                              onPressed: () {
                                // carProvider
                                //     .addItem(carProvider.myItems[index].id!);
                                // showActionSnackBar(context,
                                //     '${carProvider.myItems[index].title} added to cart! ${carProvider.cartItems.length}x');

                                MethodForDialog(context, index);
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

class Catagories extends StatelessWidget {
  const Catagories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var catagories = [
      'All',
      'Men Clothing',
      'Women Clothing',
      'Blankets',
      'Carpets'
    ];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemCount: catagories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                catagories[index],
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: index == 0
                        ? COLOR_BLUE_DARK
                        : COLOR_BLUE_DARK.withOpacity(0.3)),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }
}
