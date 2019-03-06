/**
 * 下拉选择widget
**/
import 'package:flutter/material.dart';
import '../utility/tool.dart';
import '../model/model.dart';
import '../utility/global.dart';

/**
class SelectMenu extends StatelessWidget {
  var value;
  final ValueChanged<String> onChanged;
  SelectMenu({Key key, @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _getTypeItems(),
      hint: Text('选择类型'), //当没有默认值的时候可以设置的提示
      value: value, //下拉菜单选择完之后显示给用户的值
      onChanged: (T) {
        //下拉菜单item点击之后的回调
        value = T;
        onChanged(value);
      },
      elevation: 24, //设置阴影的高度
      style: TextStyle(color: Colors.black),
      iconSize: 20.0, //设置三角标icon的大小
    );
  }

  _getTypeItems() {
    List<DropdownMenuItem> items = List();
    MyGlobal().typeList.forEach((item) {
      DropdownMenuItem dropdownMenuItem1 = DropdownMenuItem(
        child: Text(item.name),
        value: item.code,
      );
      items.add(dropdownMenuItem1);
    });
    return items;
  }
}
**/

class SelectMenu extends StatefulWidget {
  final ValueChanged<TypeModel> onChanged;
  final TypeModel selectedValue;
  SelectMenu({Key key, TypeModel this.selectedValue, @required this.onChanged})
      : super(key: key);

  @override
  _SelectMenuState createState() {
    return _SelectMenuState();
  }
}

class _SelectMenuState extends State<SelectMenu> {

  TypeModel value;

  String defaultDisplay;

  List<DropdownMenuItem> items = List();

  @override
  void initState() {
    super.initState();
    MyGlobal().typeList.forEach((item) {
      DropdownMenuItem dropdownMenuItem1 = DropdownMenuItem(
        child: Text(item.name),
        value: item,
      );
      items.add(dropdownMenuItem1);
    });
    this.value = widget.selectedValue;
    if (null==this.value || null==this.value.name){
      this.defaultDisplay = '类型选择';
    }else {
      this.defaultDisplay = this.value.name;
    }
    print(defaultDisplay);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: items,
      hint: Text(this.defaultDisplay), //当没有默认值的时候可以设置的提示
      value: value, //下拉菜单选择完之后显示给用户的值
      onChanged: (T) {
        //下拉菜单item点击之后的回调
        setState(() {
          value = T;
          widget.onChanged(value);
        });
      },
      elevation: 24, //设置阴影的高度
      style: TextStyle(color: Colors.black),
      iconSize: 20.0, //设置三角标icon的大小
    );
  }
}
