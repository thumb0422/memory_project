/**
 * 首页 类型btn
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';

class RangButton extends StatelessWidget {
  RangButton(
      {
//    this.data,
      this.title});

//  final Model data;
  final String title;

  @override
  Widget build(BuildContext context) {
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
      width: 120,
      height: 90,
      decoration: ShapeDecoration(
        image: DecorationImage(image: AssetImage('images/gouwu.png'),fit: BoxFit.fill),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.deepPurple,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        )
      ),
      child: GestureDetector(
        onTap:(){
          print(this.title);
        },
      ),
    );
  }
}


