/**
 * 首页 : 全屏、一张背景图、 下半部分多个可滑动的按钮、左下角按钮（投诉）、右下角按钮（新增）
**/
import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

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
