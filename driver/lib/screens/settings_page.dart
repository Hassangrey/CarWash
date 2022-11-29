import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart' as Urllancher;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String id = '/SettingsPage';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Wrap(children: [
        Container(
          // Settings Word
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Text(
            "Settings",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        Container(
          child: Text(
            // Personal details word
            "Personal details",
            style: TextStyle(fontSize: 20),
          ),
          margin: EdgeInsets.only(left: 10, top: 10),
          width: double.infinity,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.all(5),
              // The card contains the details
              width: 350.w,
              height: 200.h,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 244, 244),
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              margin: EdgeInsets.all(
                10.h,
              ),
              child: Row(
                children: [
                  Container(
                    // The image (Icon)
                    alignment: AlignmentDirectional.topStart,
                    width: 30.w,
                    height: 250.h,
                    child: Icon(
                      Icons.person,
                      size: 75,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // The first and last name
                        margin: EdgeInsets.only(left: 10.w, top: 20.h),
                        child: Text(
                          "Ziyad Alwagdani",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        // The email
                        margin: EdgeInsets.only(left: 30.w, top: 10.h),
                        child: Text(
                          "zalwagdani@hotmail.com",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                      Container(
                        // The phone number
                        margin: EdgeInsets.only(left: 30.w, top: 10.h),
                        child: Text(
                          "+966 55 996 8801",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                      Container(
                        // The address
                        width: 250.w,
                        height: 50.h,
                        margin: EdgeInsets.only(left: 40.w, top: 10.h),
                        child: Text(
                          "KFUPM Student Housing35248 Building 830 Room 216",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
        Container(
            // The first button (change password)
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 30.h),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text("Change password "),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                  )
                ],
              ),
              // To connect the button
              onPressed: () {
                Navigator.popAndPushNamed(context, change_password.id);
              },
            )),
        Container(
            // // The second button (change phone)
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Colors.transparent,
                      width: 2.0.w,
                    ),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text("Change Phone Number"),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                  )
                ],
              ),
              // to connect the button
              onPressed: () {
                Navigator.popAndPushNamed(context, chenge_phone.id);
              },
            )),
        // Container(
        //     // The fourth button (Payment methods)
        //     margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
        //     child: ElevatedButton(
        //       style: ButtonStyle(
        //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //           RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(18.0),
        //             side: BorderSide(
        //               color: Colors.transparent,
        //               width: 2.0.w,
        //             ),
        //           ),
        //         ),
        //       ),
        //       child: Row(
        //         children: [
        //           Text("Payement Method "),
        //           Container(
        //             alignment: AlignmentDirectional.centerEnd,
        //           )
        //         ],
        //       ),
        //       // to connect
        //       onPressed: () {},
        //     )),
        Container(
            // The fifth button (Help)
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Colors.transparent,
                      width: 2.0.w,
                    ),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text("Help"),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                  )
                ],
              ),
              //to connect
              onPressed: () {
                Urllancher.launch("tel:+966559968801");
              },
            )),
        Container(
          height: 33.h,
          // The fifth button (logout)
          margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
          child: MyCustomButton(
            title: "Logout",
            color: Color.fromARGB(255, 249, 106, 95),
            onPressed: () {},
          ),

          //to connect
        )
      ]),
    );
  }
}

const COLOR_BLUE_DARK = Color.fromARGB(255, 51, 75, 139);

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

class chenge_phone extends StatelessWidget {
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

class change_password extends StatelessWidget {
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
