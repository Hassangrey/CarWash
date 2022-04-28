import 'package:flutter/material.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/Provider.dart';
import 'package:safacw/widgets/build_provider.dart';

import '../Constants/appBarCustomized.dart';
import '../widgets/SelectServiceText.dart';

class ChooseProvider extends StatelessWidget {
  static const String id = '/chooseproviderpage';

  const ChooseProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kappBarStyle(''),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectServiceText(title: 'choose a provider'),
              Padding(
                padding: EdgeInsets.only(top: 45),
                child: Container(
                  height: MediaQuery.of(context).size.height - 300,
                  child: ListView(
                    children: [
                      buildProvider(
                        Provider(
                            name: 'x',
                            id: 1,
                            imgPath: 'images/carwashlogo.jpeg',
                            items: [
                              new Item(
                                title: 'Small Car 1',
                                price: 15,
                                imgPath: 'images/smallcar.png',
                                desc:
                                    'This is a service for small car where you can wash the external, internal part of your car or both!',
                              ),
                              new Item(
                                title: 'Small Car 2',
                                price: 15,
                                imgPath: 'images/smallcar.png',
                                desc:
                                    'This is a service for small car where you can wash the external, internal part of your car or both!',
                              ),
                            ],
                            desc: 'X car wash provider')
                      ,context),
                      buildProvider(
                        Provider(
                            name: 'y',
                            id: 1,
                            imgPath: 'images/carwashlogo.jpeg',
                            items: [
                              new Item(
                                title: 'Small Car 3',
                                price: 15,
                                imgPath: 'images/smallcar.png',
                                desc:
                                    'This is a service for small car where you can wash the external, internal part of your car or both!',
                              ),
                              new Item(
                                title: 'Small Car 4',
                                price: 15,
                                imgPath: 'images/smallcar.png',
                                desc:
                                    'This is a service for small car where you can wash the external, internal part of your car or both!',
                              ),
                              new Item(
                                title: 'Small Car 5',
                                price: 15,
                                imgPath: 'images/smallcar.png',
                                desc:
                                'This is a service for small car where you can wash the external, internal part of your car or both!',
                              ),
                            ],
                            desc: 'Y car wash provider')
                      , context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
