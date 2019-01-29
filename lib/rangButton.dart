/**
 * 首页 类型btn
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';

class RangButton extends StatelessWidget {
  RangButton({
    this.data,
  });

  Model data;
  String imageName;

  @override
  Widget build(BuildContext context) {
    onInitData();
    /*
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.deepPurple,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      height: 50,
      minWidth: 100,
      onPressed: null,
      color: Colors.grey,
      child: Text(
        this.title,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
      ),
    );
    */

    /*
    return Material(
      borderRadius: BorderRadius.circular(80.0),
      shadowColor: Colors.blue.shade200,
      elevation: 5.0,
      child: new MaterialButton(
        onPressed: () {},
        minWidth: 160.0,
        color: Colors.blue,
        child: Text(
          this.title,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        ),
      ),
    );
    */

    return Container(
      width: 100,
      height: 64,
      decoration: ShapeDecoration(
          image: DecorationImage(
              image: AssetImage(this.imageName), fit: BoxFit.fill),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.deepPurple,
              width: 0.5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
      child: GestureDetector(
        onTap: onTouchUpInside,
      ),
    );
  }

  onTouchUpInside() {
    var str = this.data.typeName;
    var str1 = "onTouchUpInside ：${str}";
    print(str1);
  }

  onInitData() {
    var imageNameTmp = data.imgName;
    imageNameTmp = "images/${imageNameTmp}";
    this.imageName = imageNameTmp;
  }
}
