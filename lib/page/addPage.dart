/**
 * 新增 页面
**/
import 'package:flutter/material.dart';
import '../view/myDropDownButton.dart';

class AddPage extends StatelessWidget {
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增记忆仓库'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 42.0),
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 50.0,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    '类型：',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 15.0),
                  height: 48.0,
                  child: MyDropdownButton(
                      //TODO:
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
            MaterialButton(
              onPressed: onSaveClick(),
              child: Text('保       存'),
            )
          ],
        ),
      ),
    );
  }

  onSaveClick() {}
}
