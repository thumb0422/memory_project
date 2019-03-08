/**
 * 列表显示Cell
 *
 * 网址
 * 说明
**/

import 'package:flutter/material.dart';
import 'package:memory_project/model/model.dart';

class InfoCell extends StatelessWidget {

  final Model data;

  const InfoCell({Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Text(this.data.accountUrl,
        style: TextStyle(
          color: Colors.red
        ),),
        Text(this.data.accountDesc,
        style: TextStyle(
          color: Colors.green
        ),),
      ],
    );
  }
}
