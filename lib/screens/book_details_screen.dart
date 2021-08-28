import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hacku2021_vol1/widgets/yellow_dot_index_middle_bar.dart';
import 'package:hacku2021_vol1/widgets/yellow_dot_index_small_bar.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(String bookTitle) async {
  final response = await http
      .get(Uri.parse('https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404?format=json&title='+bookTitle+'（）&applicationId=1033173092930546274'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {

  final int prise;
  final String title;
  // final String imageUrl;
  // final String author;

  Album({

    required this.prise,
    required this.title,
    // required this.imageUrl,
    // required this.author
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(

        prise: json['Items'][0]['Item']["itemPrice"],
        title: json['Items'][0]['Item']['title'],
        // imageUrl: json['Items'][0]['Item']['largeImageUrl'],
        // author: json['Items'][0]['Item']['author']
    );
  }
}



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
  List<String> _dorpdownmenue = ["1"];
  late Future<Album> futureAlbum;
  int comicPrice = 0;
  String totalPrice = '巻を指定してください';

  @override
  void initState() {
    super.initState();
    futureAlbum  = fetchAlbum("鬼滅の刃");
    for(int i = 2; i < (int.parse(widget.latestIssue) + 1); i++ ){
      _dorpdownmenue.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: Text(
            "詳細!",
            style: TextStyle(
              color: Colors.red.shade900,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "RocknRoll One",
              shadows: [Shadow(color: Colors.black, offset: Offset(2, 2))],
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomSpace),
            child: Padding(
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
                                items: _dorpdownmenue.map((value) {
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
                                        int num = int.parse(value) - int.parse(dropdownValue);
                                        if(int.parse(value) <= int.parse(widget.latestIssue)) {
                                          totalPrice = (int.parse(widget.bookPrice) *
                                                  num).toString();
                                          if (int.parse(totalPrice) < 0) {
                                            totalPrice = "すでに持っています";
                                          }else{
                                            totalPrice = "￥"+(int.parse(widget.bookPrice) *
                                                num).toString();
                                          }
                                        }else{
                                          totalPrice = "発売していません";
                                        }
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
                                  fontFamily: "RocknRoll One",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      totalPrice,
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
        ),
      ),
    );
  }
}
