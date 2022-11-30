import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/snackbar_widget.dart';

// TODO 5: Make a page that displays the saved addresses for the user
// * Add a new address, or delete/update an existant address

class ChangePassword extends StatelessWidget {
  static const String id = 'ChangePassword';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        child: Wrap(children: [
      Container(
        // Header (Manage Passwords)
        alignment: Alignment.center,
        margin: EdgeInsets.all(70),
        child: Text(
          "Change Password",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      Container(
        // Text field 1 (Enter your current password)
        margin: EdgeInsets.only(left: 40.w, right: 40.w),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter your current password",
          ),
        ),
      ),
      Container(
        // Text field 2 (Enter the new password)
        margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 30.h),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter the new password",
          ),
        ),
      ),
      Container(
        // Text field 3 (Reapet the new password)
        margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 30.h),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Repeat the new password",
          ),
        ),
      ),
      Container(
          height: 55.h,
          // Update password button
          margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 60.h),
          width: double.infinity,
          child: MyCustomButton(
            color: Colors.blue,
            title: "Change the password",
            onPressed: () {},
          )),
    ]));
  }
}

class MyCustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onPressed;

  const MyCustomButton({
    Key? key,
    required this.title,
    this.color = COLOR_BLUE_DARK,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          )),
    );
  }
}
