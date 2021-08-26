import 'package:flutter/material.dart';

class YellowDotIndexMiddleBar extends StatelessWidget {
  String titleOfIndex;
  double height;
  double width;

  YellowDotIndexMiddleBar({
    required this.titleOfIndex,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Image(
            image: AssetImage('designImages/register_detail_screen.png'),
          ),
          Center(
            child: Text(
              titleOfIndex,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "RocknRoll One",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
