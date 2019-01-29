/**
 * 首页 : 全屏、一张背景图、 下半部分多个可滑动的按钮、左下角按钮（投诉）、右下角按钮（新增）
**/
import 'package:flutter/material.dart';
import 'dart:ui';
import 'rangButton.dart';
import 'model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

/*
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
//      body: Center(
//        child: Image.asset('images/home.png',
//            fit: BoxFit.fill,
//            width: window.physicalSize.width,
//            height: window.physicalSize.height),
//      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image : DecorationImage(
                image:AssetImage('images/home.png'),
                centerSlice: Rect.fromLTRB(0, 0, 0, 0),//TODO:
              )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
*/

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
          width: window.physicalSize.width, height: window.physicalSize.height),
      alignment: Alignment.center,
//      padding: EdgeInsets.only(left: 0.0, bottom: 0.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/home.png'), fit: BoxFit.fill)),
      child: Container(
        height: 400,
        margin: EdgeInsets.only(bottom: 20),
//        color: Colors.red,
        child: Wrap(
          spacing: 15,
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: <Widget>[
//            RangButton(Model(typeId: '001',typeName: '测试A',desc: '我1')),
            RangButton(title:'测试A'),
            RangButton(title:'测试B'),
            RangButton(title:'测试C'),
            RangButton(title:'测试D'),
            RangButton(title:'测试E'),
            RangButton(title:'测试F'),
            RangButton(title:'测试G'),
            RangButton(title:'测试H'),
            RangButton(title:'测试J'),
            RangButton(title:'测试K'),
          ],
        ),
      )
    );
  }
}
