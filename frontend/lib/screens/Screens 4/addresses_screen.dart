import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/snackbar_widget.dart';


// TODO 5: Make a page that displays the saved addresses for the user
// * Add a new address, or delete/update an existant address

class AddressesScreen extends StatelessWidget {
  static const String id = 'Addresses Screen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text(
          'Addresses Screen',
          style: kServiceTitleStyle,
        ),
        SizedBox(height: 45,),
        Text('Your Address:', style: TextStyle(fontSize: 25),),
        SizedBox(height: 20,),

        Row(
          children:[
            Text('SaudiArbia\nDahran',textAlign:TextAlign.center ,style: TextStyle(fontSize: 25),),
            Spacer(),
            Column(children: [
              TextButton(onPressed:(){}, 
              child: Text('Update'), 
              style:TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.blueAccent,) ),
              TextButton(onPressed:(){showActionSnackBar(context, 'Your address has been deleted!');}, 
              child: Text('Delete'), 
              style:TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.redAccent,) )
             ],),

            ]),
        SizedBox(height: 45,),
        Column(children: [
          Text('Add new Address', style: TextStyle(fontSize: 20),)          
        ],),
        SizedBox(height: 10,),
        TextField(
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              hintText: 'New Address',
              prefixIcon: Icon(Icons.home)
            ),
          ),
          Column(children: [
          TextButton(onPressed:(){showActionSnackBar(context, 'Your address has been added!');}, 
          child: Text('Add'), 
          style:TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.blueAccent,) )
        ],),
        



      ]),
    );
  }
}
