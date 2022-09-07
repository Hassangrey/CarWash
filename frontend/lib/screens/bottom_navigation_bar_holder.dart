import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/screens/3rd_screen.dart';
import 'package:safacw/screens/carwash_mainpage.dart';
import 'package:safacw/screens/order_history_screen.dart';
import 'package:safacw/screens/settings_page.dart';

class NavBarHolder extends StatefulWidget {
  const NavBarHolder({Key? key}) : super(key: key);
  static const String id = '/NavigationBarHolder';

  @override
  State<NavBarHolder> createState() => _NavBarHolderState();
}

class _NavBarHolderState extends State<NavBarHolder> {
  int currentIndex = 0;
  final screens = [
    CarWashMain(),
    const OrderHistoryScreen(),
    const ThirdScreen(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 140, 182, 210),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: false,
        iconSize: 25.sp,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_wheeler),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
