import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:safacw/Constants/appBarCustomized.dart';
import 'dart:convert';

import '../Details Page/DetailPageBar.dart';
import '../services/auth_service.dart';

class OldLoginPage extends StatefulWidget {
  const OldLoginPage({Key? key}) : super(key: key);


  @override
  _OldLoginPageState createState() => _OldLoginPageState();
}

class _OldLoginPageState extends State<OldLoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passTEC = TextEditingController();
  String error_message ='';


  Future<dynamic> getData(username, password) async {
    var response = await AuthService.login(username, password);
    if(response == null) {
      error_message = 'ERROR!!!!!';
      setState(() {

      });
      return 'SERVER ERROR';
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      AuthService.setToken(data['access'], data['refresh']);
      return "true";
    } else {
      final Map<String, dynamic> data = json.decode(response.body);

      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            children: [
              DetailPageBar(tital: 'Log In', onPress: () {}),
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
                  // Validate returns true if the form is valid, or false otherwise.

                  var _email = _emailTEC.text;
                  var _pass = _passTEC.text;

                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    var result = getData(_email, _pass).then((value) {
                      if (value == "true") {
                      } else {

                        // show error message from value variable
                      }
                    });
                  }
                },
                child: const Text('Submit'),
              ),
              Text(
                error_message,
              ),
            ],
          ),
        ),
      ),
    ));
    ;
  }
}
