/**
 * 首页 : 全屏、一张背景图、 下半部分多个可滑动的按钮、左下角按钮（投诉）、右下角按钮（新增）
**/
import 'package:flutter/material.dart';
import 'dart:ui';
import '../view/rangButton.dart';
import 'package:memory_project/model/model.dart';
import 'package:memory_project/page/addPage.dart';

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
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(
              width: window.physicalSize.width,
              height: window.physicalSize.height),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/home.png'), fit: BoxFit.fill)),
          child: Container(
            child: Wrap(
              spacing: 15,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: <Widget>[
                RangButton(data: Model('0001', '理财', 'licai.png', '')),
                RangButton(data: Model('0002', '社交', 'shejiao.png', '')),
                RangButton(data: Model('0003', '支付', 'zhifu.png', '')),
                RangButton(data: Model('0004', '工作', 'work.png', '')),
                RangButton(data: Model('0005', '邮箱', 'youxiang.png', '')),
                RangButton(data: Model('0006', '购物', 'gouwu.png', '')),
                RangButton(data: Model('0007', '游戏', 'youxi.png', '')),
                RangButton(data: Model('0008', '其他', 'other.png', '')),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: addAction,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  addAction(){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>AddPage()));
}
}
