import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/addspace_functions.dart';
import 'package:safacw/models/language_constants.dart';
import 'package:safacw/services/service_providers_service.dart';
import 'package:safacw/widgets/detail_page_info_card.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarWashMain extends StatelessWidget {
  static const String id = '/carwashpage';
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
              const OffersList(),
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

class Items extends StatelessWidget {
  const Items({
    Key? key,
  }) : super(key: key);

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
            children: List.generate(4, (index) {
              return Container(
                height: 200.h,
                width: 80.w,
                color: COLOR_GREY,
              );
            })),
      ),
    );
  }
}

class OffersList extends StatelessWidget {
  const OffersList({
    Key? key,
  }) : super(key: key);

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
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(children: [
              Container(
                width: 150.w,
                height: 150.h,
                color: COLOR_BLUE_LIGHT,
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
