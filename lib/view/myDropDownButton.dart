/**
 * 下拉菜单样式
 */
import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyDropdownButton();
  }
}

class _MyDropdownButton extends State<MyDropdownButton> {
  List<DropdownMenuItem> getListData() {
    List<DropdownMenuItem> items = List();
    DropdownMenuItem dropdownMenuItem1 = DropdownMenuItem(
      child: Text('0001'),
      value: '理财',
    );
    items.add(dropdownMenuItem1);

    DropdownMenuItem dropdownMenuItem2 = DropdownMenuItem(
      child: Text('0002'),
      value: '社交',
    );
    items.add(dropdownMenuItem2);

    DropdownMenuItem dropdownMenuItem3 = DropdownMenuItem(
      child: Text('0003'),
      value: '支付',
    );
    items.add(dropdownMenuItem3);

    DropdownMenuItem dropdownMenuItem4 = DropdownMenuItem(
      child: Text('0004'),
      value: '工作',
    );
    items.add(dropdownMenuItem4);

    DropdownMenuItem dropdownMenuItem5 = DropdownMenuItem(
      child: Text('0005'),
      value: '邮箱',
    );
    items.add(dropdownMenuItem5);

    DropdownMenuItem dropdownMenuItem6 = DropdownMenuItem(
      child: Text('0006'),
      value: '购物',
    );
    items.add(dropdownMenuItem6);

    DropdownMenuItem dropdownMenuItem7 = DropdownMenuItem(
      child: Text('0007'),
      value: '游戏',
    );
    items.add(dropdownMenuItem7);

    DropdownMenuItem dropdownMenuItem8 = DropdownMenuItem(
      child: Text('0008'),
      value: '其他',
    );
    items.add(dropdownMenuItem8);

    return items;
  }

  var value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: DropdownButton(
            items: getListData(),
            hint: Text('选择类型'), //当没有默认值的时候可以设置的提示
            value: value, //下拉菜单选择完之后显示给用户的值
            onChanged: (T) {
              //下拉菜单item点击之后的回调
              setState(() {
                value = T;
              });
            },
            elevation: 24, //设置阴影的高度
            style: TextStyle(
                //设置文本框里面文字的样式
                color: Colors.black),
//              isDense: false,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
            iconSize: 20.0, //设置三角标icon的大小
          ),
        ),
      ],
    );
  }
}
