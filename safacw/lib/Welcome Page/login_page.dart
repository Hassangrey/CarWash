import 'package:flutter/material.dart';
import 'package:safacw/Constants/appBarCustomized.dart';

import '../Details Page/DetailPageBar.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String id = '/LoginPage';


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passTEC = TextEditingController();


getData(username,password) async {
          var data = await AuthService.login(username, password);

       return data;

   
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
                  DetailPageBar(tital: 'Log In', onPress: () {}
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
                      // Validate returns true if the form is valid, or false otherwise.

                      var _email = _emailTEC.text;
                      var _pass = _passTEC.text;

                      
                      var result = getData(_email,_pass);
                      if (result.statusCode==200){
                          // move to home page
                      }
                      else {
                        var message = result.body;
                      }
                   
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

                ],
              ),
            ),
          ),
        ));
    ;
  }
}
