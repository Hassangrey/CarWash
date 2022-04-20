import 'package:flutter/material.dart';
import 'package:safacw/Constants/appBarCustomized.dart';

import '../Details Page/DetailPageBar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = '/SignUpPage';


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();




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
                  Text("Email"),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Text("Password"),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
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
                      Navigator.popAndPushNamed(context, '/login');
                    },)
                ],
              ),
            ),
          ),
        ));
    ;
  }
}
