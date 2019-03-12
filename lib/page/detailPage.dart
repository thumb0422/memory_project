/**
 * 详情具体页面
**/

import 'package:flutter/material.dart';
import '../model/model.dart';
import '../utility/tool.dart';
import '../utility/global.dart';
import '../view/selectMenu.dart';
import '../utility/database.dart';

class DetailPage extends StatefulWidget {
  final Model data;
  final String title;
  const DetailPage({Key key, this.data, this.title}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _formKey = GlobalKey<FormState>();

  String _typeStr, _urlStr, _accountStr, _pwdStr, _descStr;
  bool _isObscure = true;
  Color _eyeColor;
  int selectedIndex;

  _getMenuIndex(String data){
    return MyGlobal().typeList.indexWhere((item) => item.name == data);
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = _getMenuIndex(widget.title);
    _typeStr = widget.data.typeId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}记忆详情'),
      ),
      backgroundColor: pageBgColor,
      body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              _buildTypeView(context),
              _buildUrlView(context),
              _buildAccountView(context),
              _buildPwdView(context),
              _buildDescView(context),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
              ),
              _buildSaveButton(context),
            ],
          )),
    );
  }

  _onChanged(TypeModel value) {
    _typeStr = value.code;
    print(_typeStr);
  }

  Padding _buildTypeView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 2,
          ),
          Image(
            image: AssetImage('images/about.png'),
            fit: BoxFit.fill,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '类型：',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SelectMenu(
            selectedIndex: selectedIndex,
            onChanged: _onChanged,
          )
        ],
      ),
    );
  }

  TextFormField _buildUrlView(BuildContext context) {
    return TextFormField(
      initialValue: widget.data.accountUrl,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.http),
        labelText: '网址',
      ),
      onSaved: (String value) => _urlStr = value,
    );
  }

  TextFormField _buildAccountView(BuildContext context) {
    return TextFormField(
      initialValue: widget.data.account,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box),
        labelText: '账户',
      ),
      onSaved: (String value) => _accountStr = value,
    );
  }

  TextFormField _buildPwdView(BuildContext context) {
    return TextFormField(
      initialValue: widget.data.accountPwd,
      onSaved: (String value) => _pwdStr = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      decoration: InputDecoration(
          labelText: '密码',
          prefixIcon: Icon(Icons.security),
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  TextFormField _buildDescView(BuildContext context) {
    return TextFormField(
      initialValue: widget.data.accountDesc,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.description),
        labelText: '描述',
      ),
      onSaved: (String value) => _descStr = value,
    );
  }

  Align _buildSaveButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '保存',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.black,
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //TODO 保存数据
              print(
                  'type:$_typeStr,url:$_urlStr, account:$_accountStr,assword:$_pwdStr');
              if (null == _typeStr || _typeStr.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          '提示',
                          style: TextStyle(fontSize: 14),
                        ),
                        content: SingleChildScrollView(
                          child: Text(
                            '请选择类型',
                            style: TextStyle(fontSize: 17, color: Colors.red),
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('确定')),
                        ],
                      );
                    });
              } else {
                //TODO:保存数据
                Model data =
                    Model(_typeStr, _accountStr, _urlStr, _pwdStr, _descStr);
                ///先删除再保存(不用update);
                var deleteResult = await DBProvider.db.deleteData(widget.data.id);
                var AddResult = await DBProvider.db.newData(data);
                if (AddResult > 0) {
                  print('success');
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            '提示',
                            style: TextStyle(fontSize: 14),
                          ),
                          content: SingleChildScrollView(
                            child: Text(
                              '保存成功',
                              style: TextStyle(fontSize: 17, color: Colors.red),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  ///跳转至首页
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                                child: Text('确定')),
                          ],
                        );
                      });
                } else {
                  print('failed');
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            '提示',
                            style: TextStyle(fontSize: 14),
                          ),
                          content: SingleChildScrollView(
                            child: Text(
                              '保存失败',
                              style: TextStyle(fontSize: 17, color: Colors.red),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(onPressed: null, child: Text('确定')),
                          ],
                        );
                      });
                }
              }
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }
}
