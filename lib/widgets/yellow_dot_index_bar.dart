import 'package:flutter/material.dart';

class YellowDotIndexBar extends StatelessWidget {
  String titleOfIndex;

  YellowDotIndexBar({required this.titleOfIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Image(
          image: AssetImage('designImages/mypage_bar.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            titleOfIndex,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RocknRoll One'),
          ),
        ),
      ],
    );
  }
}
