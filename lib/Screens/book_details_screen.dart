import 'package:flutter/material.dart';
import 'dart:io';

class BookDetailsScreen extends StatefulWidget {
  String bookTitle;
  String imagePath;
  String author;
  String latestIssue;
  String bookPrice;
  BookDetailsScreen({
    required this.bookTitle,
    required this.imagePath,
    required this.author,
    required this.latestIssue,
    required this.bookPrice,
  });

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String totalPrice = '7500';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "詳細",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.amber,
                  width: 300,
                  child: Center(
                    child: Text(
                      "タイトル",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
              Text(
                widget.bookTitle,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.amber,
                  width: 300,
                  child: Center(
                    child: Text(
                      "作者",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
              Text(
                widget.author,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: size.width,
                    height: 230,
                    child: Image(
                      image: AssetImage(widget.imagePath),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.amber,
                  width: 300,
                  child: Center(
                    child: Text(
                      "購入済み最新巻",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: DropdownButton(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          print(dropdownValue);
                        });
                      },
                      items: ['1', '2', '3', '4'].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Text(
                    "巻",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.amber,
                  width: 300,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 150,
                              height: 30,
                              child: TextField(
                                enabled: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                onChanged: (value) {
                                  print(value);
                                },
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "までの費用",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                '￥' + totalPrice,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.amber,
                      width: 140,
                      child: Center(
                        child: Text(
                          "発売済み最新巻",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.amber,
                      width: 140,
                      child: Center(
                        child: Text(
                          "価格（税込）",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.latestIssue + '巻',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    '￥' + widget.bookPrice,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
