import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/screens/welcome_page.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({Key? key}) : super(key: key);
  static const String id = '/ConfirmPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/laundrybackgr.jpeg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.blue.withOpacity(0.2), BlendMode.modulate),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 50, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    child: Text(
                      "Your order #6 is in progress",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Center(
                  child: Container(
                    child: Text(
                      "For any changes you have to contact your service provider",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: () {


                  },
                  splashColor: Colors.lightBlueAccent,
                  child: Ink(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Go to order',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),// ADD TO CART BUTTON
                  ),
                ),

                SizedBox(height: 25,),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, WelcomePage.id);



                  },
                  splashColor: Colors.lightBlueAccent,
                  child: Ink(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Return Home',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),// ADD TO CART BUTTON
                  ),
                ),

                SizedBox(height: 25,),

              ],
            ),
          )),
    );
  }
}
