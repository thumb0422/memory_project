/**
 * 首页 : 全屏、一张背景图、 下半部分多个可滑动的按钮、左下角按钮（投诉）、右下角按钮（新增）
**/
import 'package:flutter/material.dart';
import '../view/rangButton.dart';
import '../model/model.dart';
import '../page/addPage.dart';
import '../page/listPage.dart';
//import '../page/loginPage.dart';
import '../utility/tool.dart';
import '../utility/global.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future _future;

  @override
  void initState() {
    super.initState();
    _future = getLocalTypeModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/home.png'), fit: BoxFit.fill)),
          child: FutureBuilder<List<TypeModel>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Widget> widgets = List();
                List<TypeModel> datas = snapshot.data;
                MyGlobal().typeList = datas; //TODO:赋值给单例全局变量
                datas.forEach((item) {
                  widgets.add(RangButton(
                    data: TypeModel(item.code, item.name, item.icon),
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    data: item,
                                  )));
                    },
                  ));
                });
                return Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: widgets,
                );
              }
              return new CircularProgressIndicator();
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
