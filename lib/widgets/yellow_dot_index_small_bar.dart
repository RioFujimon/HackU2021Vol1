import 'package:flutter/material.dart';

class YellowDotIndexSmallBar extends StatelessWidget {
  String titleOfIndex;
  double height;
  double width;

  YellowDotIndexSmallBar({
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
            image: AssetImage('designImages/detail_screen_bar.png'),
          ),
          Center(
            child: Text(
              titleOfIndex,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
