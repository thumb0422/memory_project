/**
 * 新增 页面
**/
import 'package:flutter/material.dart';
import '../model/model.dart';
import '../view/selectMenu.dart';
import '../utility/database.dart';
import '../utility/global.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  String _typeStr, _urlStr, _accountStr, _pwdStr, _descStr;
  bool _isObscure = true;
  Color _eyeColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增记忆仓库'),
        centerTitle: true,
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
//              selectedValue: TypeModel('0001', '理财', 'licai.png'),
            onChanged: _onChanged,
          )
        ],
      ),
    );
  }

  TextFormField _buildUrlView(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.http),
        labelText: '网址',
      ),
      /*
      validator: (String value) {
        var emailReg = RegExp(
            r"/^((https|http|ftp|rtsp|mms){0,1}(:\/\/){0,1})www\.(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/");
        if (!emailReg.hasMatch(value)) {
          return '请输入正确的网址';
        }
      },
      */
      onSaved: (String value) => _urlStr = value,
    );
  }

  TextFormField _buildAccountView(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box),
        labelText: '账户',
      ),
      onSaved: (String value) => _accountStr = value,
    );
  }

  TextFormField _buildPwdView(BuildContext context) {
    return TextFormField(
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
              //TODO 执行登录方法
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
//                                Navigator.pop(context);
//                                Navigator.pop(context, true);
                              },
                              child: Text('确定')),
                        ],
                      );
                    });
              } else {
                //TODO:保存数据
                Model data =
                    Model(_typeStr, _accountStr, _urlStr, _pwdStr, _descStr);
                var result = await DBProvider.db.newData(data);
                if (result > 0) {
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
//                                  Navigator.popUntil(context, ModalRoute.withName('/'));
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
