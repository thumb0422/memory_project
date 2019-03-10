/**
 * 数据列表
**/
import 'package:flutter/material.dart';
import 'package:memory_project/model/model.dart';
import 'dart:math';
import '../utility/database.dart';
import '../view/infoCell.dart';

class ListPage extends StatelessWidget {
  ListPage({
    this.data,
  });
  TypeModel data;

  List<Color> colorList = [
    Color.fromRGBO(195, 242, 154, 1),
    Color.fromRGBO(238, 234, 170, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.name}记忆'),
      ),
      backgroundColor: Color.fromRGBO(243, 255, 212, 1),
      body: FutureBuilder<List<Model>>(
        future: DBProvider.db.getDatasByType(data.code),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> widgets = List();
            List<Model> datas = snapshot.data;
            datas.forEach((item) {
              var index = datas.indexOf(item);
              widgets.add(InfoCell(
                data: Model(item.typeId, item.account, item.accountUrl,
                    item.accountPwd, item.accountDesc),
                bgColor: colorList[index % 2],
              ));
            });
            if (datas.length > 0) {
              return ListView(
                children: widgets,
              );
            } else {
              return Center(
                child: Text('Nothing'),
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
