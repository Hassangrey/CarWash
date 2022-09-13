import 'package:flutter/material.dart';

Widget buildServiceCard(String title, Function() onPress) => Padding(
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
                  image: NetworkImage(
                      'https://365psd.com/images/previews/b0c/icon-pattern-backgrounds-53906.jpg'),
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
                    style: const TextStyle(
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
