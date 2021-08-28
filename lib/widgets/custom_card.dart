import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hacku2021_vol1/screens/book_details_screen.dart';

class CustomCard extends StatelessWidget {
  String bookTitle;
  String author;
  String imagePath;
  String vol;
  CustomCard(
      {required this.bookTitle, required this.author, required this.imagePath,required this.vol});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 180,
      child: GestureDetector(
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  this.bookTitle,
                  style: TextStyle(
                    fontFamily: "RocknRoll One",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                width: 130,
                child: Image(
                  image: AssetImage('images/' + imagePath),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsScreen(
                bookTitle: bookTitle,
                imagePath: 'images/' + imagePath,
                author: author,
                latestIssue: vol,
                bookPrice: '484',
              ),
            ),
          );
        },
      ),
    );
  }
}
