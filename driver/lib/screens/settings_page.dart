import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:safacw/providers/driver_provider.dart';
import 'package:safacw/screens/change_phone.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/snackbar_widget.dart';
import 'package:url_launcher/url_launcher.dart' as Urllancher;

import 'change_password.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String id = '/SettingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  getMe() async {
    var orders =
        await Provider.of<DriverProvider>(context, listen: false).getMe();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMe();
  }

  @override
  Widget build(BuildContext context) {
    var me = Provider.of<DriverProvider>(context, listen: false).me;
    var provider = Provider.of<DriverProvider>(context, listen: false);

    return PageLayout(
      child: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Wrap(children: [
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
                                "${me.username}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              // The email
                              margin: EdgeInsets.only(left: 30.w, top: 10.h),
                              child: Text(
                                "${me.email}",
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                            Container(
                              // The phone number
                              margin: EdgeInsets.only(left: 30.w, top: 10.h),
                              child: Text(
                                "${me.profile.phone}",
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                            Container(
                              // The address
                              width: 250.w,
                              height: 50.h,
                              margin: EdgeInsets.only(left: 40.w, top: 10.h),
                              child: Text(
                                "address ${me.profile.latt}:${me.profile.long}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
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
                      Navigator.pushNamed(context, ChangePassword.id);
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
                      Navigator.pushNamed(context, ChangePhone.id);
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
