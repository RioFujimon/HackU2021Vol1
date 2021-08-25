import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:hacku2021_vol1/widgets/yellow_dot_index_middle_bar.dart';
import 'package:hacku2021_vol1/widgets/yellow_dot_index_small_bar.dart';

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
          backgroundColor: Colors.white70,
          title: Text(
            "詳細",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                YellowDotIndexMiddleBar(
                  titleOfIndex: 'タイトル',
                  height: 30,
                  width: 300,
                ),
                Text(
                  widget.bookTitle,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                YellowDotIndexMiddleBar(
                  titleOfIndex: '作者',
                  height: 30,
                  width: 300,
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
                  child: Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: 230,
                        child: Image(
                          image: AssetImage(widget.imagePath),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YellowDotIndexSmallBar(
                        titleOfIndex: "購入済み最新巻",
                        height: 50,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YellowDotIndexSmallBar(
                        titleOfIndex: "発売済み最新巻",
                        height: 50,
                        width: 150,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    SizedBox(
                      width: 110,
                    ),
                    Text(
                      widget.latestIssue + '巻',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Center(
                        child: YellowDotIndexMiddleBar(
                          titleOfIndex: "",
                          height: 50,
                          width: 320,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  enabled: true,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  '￥' + totalPrice,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
