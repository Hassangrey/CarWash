import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Models/language_constants.dart';
import 'package:safacw/screens/Screens%201/viewall_screen.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/widgets/snackbar_widget.dart';

import '../../Constants/addspace_functions.dart';
import '../carwash_main_screen.dart';

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
                        style: TextStyle(
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
  final List CatPic = [
    'https://i.ebayimg.com/images/g/aMcAAOSwIL5iMLPb/s-l500.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBdf5O3NfFcE1CSY9UHSFb7ycnuY-lkRdME3AQqor5zImIJQIG2EEft1nKup_M_W4T-30&usqp=CAU',
    'https://prod.haglofs-excite.com/assets/blobs/6045442C5_ST_NM_FR_1_W1_DWB-ba211e611d.jpeg?preset=tiny&dpr=2'
        'https://www.picng.com/upload/dress_shirt/png_dress_shirt_26350.png'
  ];
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
  final List Itemss = ['T Shirt', 'Shorts', 'Pants', 'Shirt'];
  final List serPic = [
    'https://cdn.pixabay.com/photo/2017/01/13/04/56/t-shirt-1976334_1280.png',
    'https://w7.pngwing.com/pngs/256/128/png-transparent-bermuda-shorts-clothing-pants-jack-wolfskin-short-pants-shoe-unisex-active-shorts.png',
    'https://e7.pngegg.com/pngimages/738/197/png-clipart-cargo-pants-t-shirt-trousers-trouser-s-trouser-png-transparent-images-transparency-and-translucency.png',
    'https://www.picng.com/upload/dress_shirt/png_dress_shirt_26350.png'
  ];
  @override
  Widget build(BuildContext context) {
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
                children: List.generate(Itemss.length, (index) {
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
                            child: Image.network(serPic[index])),
                      ),
                      Text(Itemss[index],
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
                                    context, '${Itemss[index]} added to cart!');
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
