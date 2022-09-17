import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/screens/Screens%201/laundry_main_screen.dart';
import 'package:safacw/screens/Screens%203/cart_screen.dart';
import 'package:safacw/screens/carwash_main_screen.dart';
import 'package:safacw/screens/Screens%203/order_history_screen.dart';
import 'package:safacw/screens/Screens%204/settings_screen.dart';

class NavBarHolder extends StatefulWidget {
  const NavBarHolder({Key? key}) : super(key: key);
  static const String id = '/NavigationBarHolder';

  @override
  State<NavBarHolder> createState() => _NavBarHolderState();
}

class _NavBarHolderState extends State<NavBarHolder> {
  int currentIndex = 0;
  final screens = [
    LaundryMainScreen(),
    const OrderHistoryScreen(),
    CartScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 207, 227, 240),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: false,
        iconSize: 25.sp,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
