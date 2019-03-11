/**
 * 首页 类型btn
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_project/model/model.dart';

class RangButton extends StatelessWidget {
  RangButton({
    this.data,
    this.callback,
  });

  final TypeModel data;
  final GestureTapCallback callback;
  String icon;

  @override
  Widget build(BuildContext context) {
    onInitData();
    return Container(
      width: 100,
      height: 64,
      decoration: ShapeDecoration(
          image: DecorationImage(
              image: AssetImage(this.icon), fit: BoxFit.fill),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.deepPurple,
              width: 0.5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
      child: GestureDetector(
        onTap: (){
          callback();
        },
      ),
    );
  }

  onTouchUpInside() {
    var str = this.data.name;
    var str1 = "onTouchUpInside ：${str}";
    print(str1);
  }

  onInitData() {
    var imageNameTmp = data.icon;
    imageNameTmp = "images/${imageNameTmp}";
    this.icon = imageNameTmp;
  }
}
