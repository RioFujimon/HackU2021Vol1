import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hacku2021_vol1/widgets/yellow_dot_index_middle_bar.dart';

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
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            children: [
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
                child: Image.file(
                  File(widget.imagePathFromCamera),
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
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
