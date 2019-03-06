/**
 * 数据列表
**/
import 'package:flutter/material.dart';
import 'package:memory_project/model/model.dart';

class ListPage extends StatelessWidget {
  ListPage({
    this.data,
  });
  Model data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text('${data.typeName}记忆'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
