/**
 * 首页 类型btn
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';

class RangButton extends StatelessWidget {
  RangButton({
//    this.data,
    this.title
  });

//  final Model data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: new Text(
//        this.data.typeName,
        "$title",
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.yellowAccent,
        ),
      ),
    );
  }
}
