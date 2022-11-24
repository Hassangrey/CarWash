import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safacw/screens/bottom_navigation_bar_holder.dart';
import 'package:safacw/screens/login_screen.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/auth_service.dart';
import 'signup_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = '/SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  //WIDGETS
  TextEditingController _userlTEC = TextEditingController();
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passTEC = TextEditingController();
  TextEditingController _confirmPassTEC = TextEditingController();
  TextEditingController _phoneNumberTEC = TextEditingController();

  bool showPass = true;

  Future<dynamic> getData(email, username, password) async {
    var response = await AuthService.register(email, username, password);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      var response2 = await AuthService.login(username, password);

      if (response2.statusCode == 200) {
        final Map<String, dynamic> data2 = json.decode(response2.body);
        AuthService.setToken(data2['access'], data2['refresh']);
        // move to another page bellow
        Navigator.popAndPushNamed(context, NavBarHolder.id);

        return "true";
      } else {
        final Map<String, dynamic> data2 = json.decode(response.body);

        return data2;
      }
    } else {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    }
  }

  Widget buildUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextFormField(
            controller: _userlTEC,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xFF3c8ad1),
                ),
                hintText: 'Enter Your username',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailTEC,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xFF3c8ad1),
                ),
                hintText: 'Enter Your Email',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone Number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _phoneNumberTEC,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xFF3c8ad1),
                ),
                hintText: 'Enter Your phone number',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextFormField(
            controller: _passTEC,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            obscureText: showPass,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color(0xFF3c8ad1),
                ),
                suffixIcon: IconButton(
                  icon: showPass
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    setState(
                      () => showPass = !showPass,
                    );
                  },
                ),
                hintText: 'Enter Your Password',
                hintStyle: const TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Confirm Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextFormField(
            controller: _confirmPassTEC,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (_passTEC.text != _confirmPassTEC.text) {
                return 'The passwords do not match !';
              }
              return null;
            },
            obscureText: true,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFF3c8ad1),
                ),
                hintText: 'Enter Your Password Again',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildSignUpBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          var _user = _userlTEC.text;
          var _email = _emailTEC.text;
          var _pass = _passTEC.text;
          var _phone = _phoneNumberTEC.text;
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            var result = getData(_email, _user, _pass).then((value) {
              if (value == "true") {
                Navigator.popAndPushNamed(context, NavBarHolder.id);
              } else {
                // show error message from value variable
              }
            });
          }
        },
        child: const Text(
          'SIGN UP',
          style: TextStyle(
            color: Color(0xFF3c8ad1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildLoginBtn(Function() onPress) {
    return ElevatedButton(
      onPressed: onPress,
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: 'Already got an account? ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          TextSpan(
              text: 'Login',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0x663c8ad1),
                        Color(0x993c8ad1),
                        Color(0xCC3c8ad1),
                        Color(0xFF3c8ad1),
                      ])),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        buildUserName(),
                        const SizedBox(height: 15),
                        buildEmail(),
                        const SizedBox(height: 15),
                        buildPhoneNumber(),
                        const SizedBox(height: 15),
                        buildPassword(),
                        const SizedBox(height: 15),
                        buildConfirmPassword(),
                        const SizedBox(height: 25),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            NavBarHolder.id,
                          ),
                          child: Text(
                            'Skip ->',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                            ),
                          ),
                        ),
                        buildSignUpBtn(),
                        buildLoginBtn(() {
                          Navigator.popAndPushNamed(context, LoginScreen.id);
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
