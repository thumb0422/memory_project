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
  final Color bgColor;

  const InfoCell({Key key, @required this.data, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.bgColor,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: TitleValueView(
                        title: '网址', value: this.data.accountUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 30, 5),
                    child: TitleValueView(
                        title: '说明', value: this.data.accountDesc),
                  ),
                ],
              )),
              Container(
                width: 40,
                child: Image.asset('images/rightArrow.png'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Divider(
              height: 0.5,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
