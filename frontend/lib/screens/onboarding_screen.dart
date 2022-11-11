import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/addspace_functions.dart';
import 'package:safacw/screens/Screens%203/cart_screen.dart';
import 'package:safacw/screens/choose_service_screen.dart';
import 'package:safacw/widgets/page_layout.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = '/OnBoardingScreen';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<dynamic> screens = [
    OnBoard(
      imgPath: 'assets/images/cleaning.json',
      title:
          'Safa\', find the best cleaning services \n you\'ve been looking for ',
      subtitle:
          'Safa\', is a multi-services app that helps you find the best cleaning solution to all your problems! ',
    ),
    OnBoard(
      imgPath: 'assets/images/laundry.json',
      title: 'Choose the best laundry for your clothes',
      subtitle:
          'Safa offers you a list of laundry providers for you to choose from!',
    ),
    OnBoard(
      imgPath: 'assets/images/car-wash.json',
      title: 'Choose the best carwash for your car',
      subtitle:
          'Safa offers you a list of car wash providers for you to choose from!',
    ),
    OnBoard(
      imgPath: 'assets/images/house-cleaning.json',
      title: 'Choose the best building cleaning for your rooms and building',
      subtitle:
          'Safa offers you a list of building cleaning providers for you to choose from!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: screens.length,
                  onPageChanged: (index) => setState(() {
                    _pageIndex = index;
                  }),
                  itemBuilder: (BuildContext context, int index) {
                    return OnBoardingScreenItem(
                      imgPath: screens[index].imgPath,
                      title: screens[index].title,
                      subtitle: screens[index].subtitle,
                    );
                  },
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    screens.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CustomIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 60.w,
                    height: 60.h,
                    child: MyCustomButton(
                      title: '>',
                      onPressed: () {
                        if (_pageIndex == screens.length - 1) {
                          Navigator.pushNamed(context, WelcomePage.id);
                        }
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12.h : 4,
      width: 4.w,
      decoration: BoxDecoration(
        color: isActive ? COLOR_BLUE_DARK : COLOR_BLUE_LIGHT,
      ),
    );
  }
}

class OnBoard {
  final String title;
  final String subtitle;
  final String imgPath;

  OnBoard({
    required this.title,
    required this.subtitle,
    required this.imgPath,
  });
}

class OnBoardingScreenItem extends StatelessWidget {
  const OnBoardingScreenItem({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String imgPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          imgPath,
          height: 250.h,
        ),
        Text(
          title,
          style: kTitleStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 22.sp,
              color: COLOR_BLUE_DARK),
          textAlign: TextAlign.center,
        ),
        addVerticalSpace(16.sp),
        Text(subtitle, textAlign: TextAlign.center),
        const Spacer(),
      ],
    );
  }
}
