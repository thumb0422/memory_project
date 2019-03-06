/**
 * 下拉选择widget
**/
import 'package:flutter/material.dart';
import '../utility/tool.dart';
import '../model/model.dart';

class SelectMenu extends StatefulWidget {
  @override
  _SelectMenuState createState() {
    return _SelectMenuState();
  }
}

class _SelectMenuState extends State<SelectMenu> {
  Future _future;
  var value;

  @override
  void initState() {
    super.initState();
    _future = getLocalTypeModels();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DropdownMenuItem> items = List();
            List<TypeModel> datas = snapshot.data;
            datas.forEach((item) {
              TypeModel data = item;
              DropdownMenuItem dropdownMenuItem1 = DropdownMenuItem(
                child: Text(item.name),
                value: item.code,
              );
              items.add(dropdownMenuItem1);
            });
            return DropdownButton(
              items: items,
              hint: Text('选择类型'), //当没有默认值的时候可以设置的提示
              value: value, //下拉菜单选择完之后显示给用户的值
              onChanged: (T) {
                //下拉菜单item点击之后的回调
                setState(() {
                  value = T;
                  print(value);
                });
              },
              elevation: 24, //设置阴影的高度
              style: TextStyle(color: Colors.black),
              iconSize: 20.0, //设置三角标icon的大小
            );
          }
          return CircularProgressIndicator();
        });
  }
}
