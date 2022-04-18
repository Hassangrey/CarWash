import 'package:flutter/material.dart';

Widget buildServiceCard() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Positioned(
        bottom: 12,
        left: 12,
        right: 12,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Ink.image(
                    image: AssetImage('images/laundrybackg.jpeg'),
                    height: 150,
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Text(
                      'Car Wash',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
