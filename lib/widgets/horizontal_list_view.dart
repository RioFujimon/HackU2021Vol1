import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hacku2021_vol1/widgets/custom_card.dart';

class HorizontalListView extends StatefulWidget {
  int index;
  List<List<String>> twoDimImageList;
  List<List<String>> twoDimTitleList;
  List<List<String>> twoDimAuthorList;
  List<List<String>> twoDimVolList;
  HorizontalListView(
      {
        required this.index,
        required this.twoDimImageList,
        required this.twoDimTitleList,
        required this.twoDimAuthorList,
        required this.twoDimVolList
      });

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  List<CustomCard> displayHorizontalListView(
    int index,
    List<List<String>> twoDimTitleList,
    List<List<String>> twoDimAuthorList,
    List<List<String>> twoDimImageList,
    List<List<String>> twoDimVolList,
  ) {
    List<CustomCard> customCardList = [];
    for (int i = 0; i < twoDimImageList[index].length; i++) {
      customCardList.add(
        CustomCard(
          bookTitle: twoDimTitleList[index][i],
          author: twoDimAuthorList[index][i],
          imagePath: twoDimImageList[index][i],
          vol:twoDimVolList[index][i]
        ),
      );
    }

    return customCardList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: displayHorizontalListView(
        widget.index,
        widget.twoDimTitleList,
        widget.twoDimAuthorList,
        widget.twoDimImageList,
        widget.twoDimVolList
      ),
    );
  }
}
