/**
 * 详情具体页面
**/

import 'package:flutter/material.dart';
import '../model/model.dart';

class DetailPage extends StatelessWidget{

  final Model data;

  const DetailPage({Key key,this.data}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text('${data.name}记忆'),
      ),
      backgroundColor: Color.fromRGBO(243, 255, 212, 1),
      body: Text(this.data.accountDesc),
    );
  }
}