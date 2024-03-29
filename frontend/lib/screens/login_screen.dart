import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safacw/screens/signup_page.dart';
import 'dart:convert';

import '../services/auth_service.dart';
import 'choose_service_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = '/LoginPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  //WIDGETS
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passTEC = TextEditingController();
  bool showPass = true;

  Future<dynamic> getData(username, password) async {
    var response = await AuthService.login(username, password);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      AuthService.setToken(data['access'], data['refresh']);
      return "true";
    } else {
      final Map<String, dynamic> data = json.decode(response.body);

      return data;
    }
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
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
                return 'Please enter your username';
              }
              return null;
            },
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
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

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
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
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFF3c8ad1),
                ),
                suffixIcon: IconButton(
                  icon: showPass
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    setState(
                      () => showPass = !showPass,
                    );
                  },
                ),
                hintText: 'Enter Your Password',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () => print('Forgot Pass?'),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          var _email = _emailTEC.text;
          var _pass = _passTEC.text;
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            var result = getData(_email, _pass).then((value) {
              if (value == "true") {
                Navigator.popAndPushNamed(context, WelcomePage.id);
              } else {
                // show error message from value variable
              }
            });
          }
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildSignUpBtn(Function() onPress) {
    return ElevatedButton(
      onPressed: onPress,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          TextSpan(
              text: 'Sign Up',
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
                  decoration: BoxDecoration(
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
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50),
                        // Make widget
                        buildEmail(),
                        SizedBox(height: 50),
                        buildPassword(),
                        buildForgotPassBtn(),
                        buildLoginBtn(),
                        buildSignUpBtn(() {
                          Navigator.popAndPushNamed(context, SignUpPage.id);
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
