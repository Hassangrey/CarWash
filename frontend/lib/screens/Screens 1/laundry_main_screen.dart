import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/models/language_constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/addspace_functions.dart';
import '../carwash_main_screen.dart';

// TODO 1: Make laundry page the contains a title, list of offers
// * Display List of items that the provider got

class LaundryMainScreen extends StatelessWidget {
  static const String id = 'LaundryScreen';
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
                'Offers',
                style: (kServiceTitleStyle),
              ),
              addVerticalSpace(18.h),
              OffersList(),
              addVerticalSpace(28.h),
              Text(
                'Categories',
                style: (kServiceTitleStyle),
              ),
              addVerticalSpace(18.h),
              CategoriesList(),
              addVerticalSpace(28.h),
              Text(
                'Services',
                style: (kServiceTitleStyle),
              ),
              addVerticalSpace(18.h),
              Items(),
              addVerticalSpace(40.h),
            ],
          ),
        ),
      ),
    );
  }
}
class OffersList extends StatelessWidget {
  final List Offerss = ['50% today', 'free delivery','t3'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
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
              Container(
                width: 150.w,
                height: 150.h,
                child: Column( children:[Image.network('https://www.rd.com/wp-content/uploads/2021/09/GettyImages-1181334518-MLedit.jpg'),
                Align(alignment: Alignment.bottomLeft,
                    child: Text(Offerss[index],
                        style: TextStyle(fontSize: 20)))]),
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
  final List CatAss = ['shirt', 'thobe','pants'];
  final List CatPic = ['https://i.ebayimg.com/images/g/aMcAAOSwIL5iMLPb/s-l500.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBdf5O3NfFcE1CSY9UHSFb7ycnuY-lkRdME3AQqor5zImIJQIG2EEft1nKup_M_W4T-30&usqp=CAU',
    'https://prod.haglofs-excite.com/assets/blobs/6045442C5_ST_NM_FR_1_W1_DWB-ba211e611d.jpeg?preset=tiny&dpr=2'];
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
            return Wrap( direction: Axis.vertical,
                children: [
              Container(
                width: 150.w,
                height: 150.h,
                child: Column( children:[Image.network(CatPic[index]),
                  Align(alignment: Alignment.bottomLeft,
                      child: Text(CatAss[index],
                          style: TextStyle(fontSize: 15)))]),
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
class Items extends StatelessWidget {
  final List Itemss = ['i1', 'i2','i3', 'i4'];
  final List serPic = ['https://media-exp1.licdn.com/dms/image/C4D0BAQEfkjKN0gXJ0A/company-logo_200_200/0/1611658792111?e=2147483647&v=beta&t=odWk8Lnsbp4YxX2N9J-o5eC4vqmT7qG25BQn2u7VSjo',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ-LOra15s67n_yZpSwd2dtFqIJU9jfJ1IyA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSwc6nM0gvsLE5r0m2RMFitezGMQJr1QM09w&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZUEsrFdEwfuhuDhQ5JDH-PQxBX3U7uFHrKA&usqp=CAU'];
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: SizedBox(
        height: 300.h,
        child: GridView.count(
            primary: false,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            children: List.generate(Itemss.length, (index) {
              return Container(
                height: 200.h,
                width: 80.w,
                child: Column( children:[Image.network(serPic[index]),
                  Align(alignment: Alignment.bottomLeft,
                      child: Text(Itemss[index],
                          style: TextStyle(fontSize: 15)))]),

              );
            })),
      ),
    );
  }
}