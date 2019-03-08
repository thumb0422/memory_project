/**
 * Key Value  Label
**/

import 'package:flutter/material.dart';

class TitleValueView extends StatelessWidget {
  final String title;
  final String value;
  final Color bgColor;
  const TitleValueView({Key key, this.title, this.value,this.bgColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.bgColor,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Text(
              this.title,
              style: TextStyle(color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Text(
              this.value,
              style: TextStyle(color: Colors.red),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
        ],
      ),
    );
  }
}
