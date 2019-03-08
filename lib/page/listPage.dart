/**
 * 数据列表
**/
import 'package:flutter/material.dart';
import 'package:memory_project/model/model.dart';
import '../utility/database.dart';
import '../view/infoCell.dart';

class ListPage extends StatelessWidget {
  ListPage({
    this.data,
  });
  TypeModel data ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.name}记忆'),
      ),
      body: FutureBuilder<List<Model>>(
        future: DBProvider.db.getDatasByType(data.code),
        builder: (context,snapshot){
          if (snapshot.hasData){
            List<Widget> widgets = List();
            List<Model> datas = snapshot.data;
            datas.forEach((item){
              widgets.add(InfoCell(data: Model(item.typeId, item.account, item.accountUrl,item.accountPwd,item.accountDesc)));
            });
            if (datas.length > 0){
              return ListView(
                children: widgets,
              );
            }else{
              return Text('Nothing');
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
