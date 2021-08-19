import 'dart:io';
import 'package:flutter/material.dart';

class RegisterBookScreen extends StatefulWidget {
  String imagePathFromCamera;
  RegisterBookScreen({required this.imagePathFromCamera});
  @override
  _RegisterBookScreenState createState() => _RegisterBookScreenState();
}

class _RegisterBookScreenState extends State<RegisterBookScreen> {
  String bookTitle = "呪術廻戦";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "登録",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomSpace),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    width: 300,
                    child: Center(
                      child: Text(
                        "タイトル",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
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
                  height: 400,
                  child: Image.file(
                    File(widget.imagePathFromCamera),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    width: 300,
                    child: Center(
                      child: Text(
                        "購入済みの最新巻",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Flexible(
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
                      Text(
                        "巻",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  child: Text(
                    '登録',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.amber,
                  onPressed: () {
                    print('登録');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
