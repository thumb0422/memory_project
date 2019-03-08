/**
 * 列表显示Cell
 *
 * 网址
 * 说明
**/

import 'package:flutter/material.dart';
import '../model/model.dart';
import '../view/titleValueView.dart';

class InfoCell extends StatelessWidget {

  final Model data;

  const InfoCell({Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleValueView(title: '网址', value: this.data.accountUrl,bgColor: Colors.grey,),
        TitleValueView(title: '说明', value: this.data.accountDesc,bgColor: Colors.blue),
      ],
    );
  }
}
