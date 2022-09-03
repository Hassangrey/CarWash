// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/Models/Provider.dart';
import 'package:safacw/screens/carwash_mainpage.dart';
import 'package:safacw/widgets/build_provider.dart';
import '../Constants/appBarCustomized.dart';
import '../services/provider_service.dart';
import '../widgets/SelectServiceText.dart';
import 'loadingscreen_page.dart';

class ChooseProvider extends StatelessWidget {
  static const String id = '/chooseproviderpage';

  const ChooseProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kappBarStyle(''),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: FutureBuilder(
          future: ProviderService.get_all(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.data == null) {
              return LoadingScreen();
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectServiceText(title: 'choose a provider'),
                    Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 300,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {

                              if (snapshot.data[index].name != null) {
                                return ListTile(
                                  leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/carwashlogo.jpeg')
                                      // NetworkImage(snapshot.data[index].imgPath),
                                      ),
                                 title: Text(snapshot.data[index].name),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => CarWashMain(provider: snapshot.data[index]),
                                      ),
                                    );                                  },
                                  // subtitle: Text(snapshot.data[index].desc),
                                );
                              } else
                                return Text('');
                            }),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
