import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Star extends StatelessWidget {
  double sizeStar = 5;
  String kind = 'full';
  Star(this.sizeStar, this.kind);
  @override
  Widget build(BuildContext context) {
    final star = Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: sizeStar,
          ),
        ));
    final starHalf = Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star_half,
            color: Colors.yellow,
            size: sizeStar,
          ),
        ));
    final starEmpty = Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star_border,
            color: Colors.yellow,
            size: sizeStar,
          ),
        ));
    switch (kind) {
      case "full":
        return star;
      case "half":
        return starHalf;
      case "empty":
        return starEmpty;
      default:
        return starEmpty;
    }
  }
}
