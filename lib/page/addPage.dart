/**
 * 新增 页面
**/
import 'package:flutter/material.dart';
import '../view/myDropDownButton.dart';

class AddPage extends StatelessWidget {
  var value;

  _onSaveClick(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('保存成功'),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增记忆仓库'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15.0),
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15),
                ),
                Image(
                  image: AssetImage('images/about.png'),
                  fit: BoxFit.fill,
                  width: 20,
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text(
                  '类型：',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                ),
                MyDropdownButton()
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "网址",
                        hintText: "请输入网址",
                        prefixIcon: Icon(Icons.person)),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "账号",
                        hintText: "请输入账号",
                        prefixIcon: Icon(Icons.account_box)),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "请输入密码",
                        prefixIcon: Icon(Icons.security)),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "描述",
                        hintText: "请输入描述信息",
                        prefixIcon: Icon(Icons.person)),
                  ),
                )
              ],
            ),
            Row(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, top: 100),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  onPressed: () {
                    _onSaveClick(context);
                  },
                  color: const Color(0xfff1c232),
                  child: new Text(
                    '保存',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20.0,
                      letterSpacing: 100,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
