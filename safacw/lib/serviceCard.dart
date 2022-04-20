import 'package:flutter/material.dart';

Widget buildServiceCard(String title, String imgPath, Function() onPress) => Padding(
      padding: const EdgeInsets.all(8.0),
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
                  image: AssetImage(imgPath),
                  height: 150,
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: onPress,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Text(
                    title,
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
    );
