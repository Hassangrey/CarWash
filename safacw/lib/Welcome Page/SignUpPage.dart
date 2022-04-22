import 'package:flutter/material.dart';
import 'package:safacw/Constants/appBarCustomized.dart';
import 'package:safacw/Welcome%20Page/login_page.dart';
import 'package:safacw/Welcome%20Page/login_screen.dart';

import '../Details Page/DetailPageBar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = '/SignUpPage';


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userTEC = TextEditingController();
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passTEC = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: SafeArea(
              child: Column(
                children: [
                  DetailPageBar(tital: 'SIGN UP', onPress: () {}
                  ),
                  Text("Username"),
                  TextFormField(
                    controller: _userTEC,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Email"),
                  TextFormField(
                    controller: _emailTEC,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Password"),
                  TextFormField(
                    controller: _passTEC,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var _userName = _userTEC.text;
                      var _email = _emailTEC.text;
                      var _pass = _passTEC.text;
                      print("USER: $_userName  ||  EMAIL: $_email  || PASS: $_pass ");
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    child: Text('already have an account?'),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, LoginScreen.id);
                    },)
                ],
              ),
            ),
          ),
        ));
    ;
  }
}
