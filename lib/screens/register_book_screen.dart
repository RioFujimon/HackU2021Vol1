import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hacku2021_vol1/widgets/yellow_dot_index_middle_bar.dart';
import 'package:http/http.dart' as http;


Future<Album> fetchAlbum(String isbnCode) async {
  final response = await http
      .get(Uri.parse('https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404?format=json&isbn='+isbnCode+'&applicationId=1033173092930546274'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {

  final String title;
  final String titleKana;
  final String imageUrl;
  final String author;

  Album({

    required this.title,
    required this.titleKana,
    required this.imageUrl,
    required this.author
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(

      title: json['Items'][0]['Item']['title'],
      titleKana: json['Items'][0]['Item']['titleKana'],
      imageUrl: json['Items'][0]['Item']['largeImageUrl'],
      author: json['Items'][0]['Item']['author']
    );
  }
}


class RegisterBookScreen extends StatefulWidget {
  String isbnCode;
  RegisterBookScreen({required this.isbnCode});

  @override
  _RegisterBookScreenState createState() => _RegisterBookScreenState();
}

class _RegisterBookScreenState extends State<RegisterBookScreen> {
  late Future<Album> futureAlbum;
  String bookTitle = "";
  String imageUrl = "";
  String titleKana = "";
  String author = "";

  @override
  void initState() {
    super.initState();
    futureAlbum  = fetchAlbum(widget.isbnCode);

  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea (
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            title: Text(
          "登録!",
          style: TextStyle(
            color: Colors.red.shade900,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "RocknRoll One",
            shadows: [Shadow(color: Colors.black, offset: Offset(2, 2))],
          ),
        ),
      ),
          body: SingleChildScrollView (
            reverse: true,
            child: Center(
              child: Column (
                children: [
                  FutureBuilder<Album>(
                    //データの格納
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        //bookTitle =
                        trimTitle(snapshot.data!.title);
                        setAuthor(snapshot.data!.author);
                        setKana(snapshot.data!.titleKana);

                        print(bookTitle);

                        imageUrl = snapshot.data!.imageUrl;

                        // imageUrl = getVol1Image(bookTitle);
                        //saveDB();
                      } else if (snapshot.hasError) {
                        //print(futureAlbum);
                        return Text('${snapshot.error}');

                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                  YellowDotIndexMiddleBar(
                    titleOfIndex: 'タイトル',
                    height: 50,
                    width: 300,
                  ),
                  Text(
                    bookTitle,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(
                  width: size.width,
                  height: 350,
                  child: Image.network(
                    imageUrl
                  ),
                ),
                YellowDotIndexMiddleBar(
                  titleOfIndex: '購入済みの最新刊',
                  height: 50,
                  width: 300,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 50,
                        width: 270,
                        child: TextField(
                          enabled: true,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ),
                  Text(
                    "巻",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              FlatButton(
                child: SizedBox(
                  height: 180,
                  width: 180,
                  child: Image(
                    image: AssetImage('designImages/register_button.png'),
                  ),
                ),
                onPressed: () {
                  print('登録');
                  Navigator.pop(
                      context
                  );
                  //saveComicData();
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
  void trimTitle(String title){
    bookTitle = title.split("（")[0];
  }

  void setAuthor(String setAuthor){
    author = setAuthor;
    print(author);
  }

  void setKana(String kana){
    titleKana = kana;
  }

  // String getVol1Image(String bookTitle) {
  //
  // }
}
