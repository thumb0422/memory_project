/**
 * 数据列表
**/
import 'package:flutter/material.dart';
import 'package:memory_project/model/model.dart';
import '../utility/database.dart';
import '../view/infoCell.dart';
import '../page/detailPage.dart';
import '../utility/global.dart';

class ListPage extends StatelessWidget {
  ListPage({
    this.data,
  });
  final TypeModel data;

  final List<Color> colorList = [
    Color.fromRGBO(195, 242, 154, 1),
    Color.fromRGBO(238, 234, 170, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.name}记忆'),
      ),
      backgroundColor: pageBgColor,
      body: FutureBuilder<List<Model>>(
        future: DBProvider.db.getDatasByType(data.code),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> widgets = List();
            widgets.add(SizedBox(
              height: 4,
            ));
            List<Model> datas = snapshot.data;
            datas.forEach((item) {
              var index = datas.indexOf(item);
              widgets.add(InfoCell(
                data: item,
                bgColor: colorList[index % 2],
                onCellSelected: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                data: item,
                                title: this.data.name,
                              )));
                },
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
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
