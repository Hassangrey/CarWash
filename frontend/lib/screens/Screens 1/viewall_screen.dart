import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/Constants/Constants.dart';
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
  final List Itemss = [
    'T Shirt',
    'Shorts',
    'Pants',
    'Shirt',
    'T Shirt',
    'Shorts',
    'Pants',
    'Shirt',
    'T Shirt',
    'Shorts',
    'Pants',
    'Shirt',
  ];
  final List serPic = [
    'https://cdn.pixabay.com/photo/2017/01/13/04/56/t-shirt-1976334_1280.png',
    'https://w7.pngwing.com/pngs/256/128/png-transparent-bermuda-shorts-clothing-pants-jack-wolfskin-short-pants-shoe-unisex-active-shorts.png',
    'https://e7.pngegg.com/pngimages/738/197/png-clipart-cargo-pants-t-shirt-trousers-trouser-s-trouser-png-transparent-images-transparency-and-translucency.png',
    'https://www.picng.com/upload/dress_shirt/png_dress_shirt_26350.png',
    'https://cdn.pixabay.com/photo/2017/01/13/04/56/t-shirt-1976334_1280.png',
    'https://w7.pngwing.com/pngs/256/128/png-transparent-bermuda-shorts-clothing-pants-jack-wolfskin-short-pants-shoe-unisex-active-shorts.png',
    'https://e7.pngegg.com/pngimages/738/197/png-clipart-cargo-pants-t-shirt-trousers-trouser-s-trouser-png-transparent-images-transparency-and-translucency.png',
    'https://www.picng.com/upload/dress_shirt/png_dress_shirt_26350.png',
    'https://cdn.pixabay.com/photo/2017/01/13/04/56/t-shirt-1976334_1280.png',
    'https://w7.pngwing.com/pngs/256/128/png-transparent-bermuda-shorts-clothing-pants-jack-wolfskin-short-pants-shoe-unisex-active-shorts.png',
    'https://e7.pngegg.com/pngimages/738/197/png-clipart-cargo-pants-t-shirt-trousers-trouser-s-trouser-png-transparent-images-transparency-and-translucency.png',
    'https://www.picng.com/upload/dress_shirt/png_dress_shirt_26350.png',
  ];
  @override
  Widget build(BuildContext context) {
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
