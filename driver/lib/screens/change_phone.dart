import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/snackbar_widget.dart';
import 'change_password.dart';

// TODO 5: Make a page that displays the saved addresses for the user
// * Add a new address, or delete/update an existant address

class ChangePhone extends StatelessWidget {
  static const String id = 'ChangePhone';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Wrap(children: [
        Container(
          // Header (Manage Phone Number)
          alignment: Alignment.center,
          margin: EdgeInsets.all(70),
          child: Text(
            "Change Phone Number",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Container(
          // Text field
          margin: EdgeInsets.only(left: 40, right: 40),
          child: TextFormField(
            obscureText: false,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
              hintText: "05XXXXXXXX",
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
              title: "Change number",
              onPressed: () {},
            )),
      ]),
    );
  }
}
