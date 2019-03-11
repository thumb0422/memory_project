/**
 * 详情具体页面
**/

import 'package:flutter/material.dart';
import '../model/model.dart';
import '../utility/tool.dart';
import '../utility/global.dart';

class DetailPage extends StatelessWidget {
  final Model data;
  final String title;
  const DetailPage({Key key, this.data, this.title}) : super(key: key);

//  final _formKey = GlobalKey<FormState>();

  final bool _isObscure = true;
  final Color _eyeColor = null;
  static String _urlStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.title}记忆详情'),
      ),
      backgroundColor: pageBgColor,
      body: FutureBuilder(
          future: getLocalTypeModels(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Form(
                  child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
//                    _buildTypeView(context),
                    _buildUrlView(context),
//                    _buildAccountView(context),
//                    _buildPwdView(context),
//                    _buildDescView(context),
                  SizedBox(
                    height: 40,
                  ),
//                    _buildSaveButton(context),
                ],
              ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  TextFormField _buildUrlView(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.http),
        labelText: '网址',
        hintText: this.data.accountUrl
      ),

      onSaved: (String value) => _urlStr = value,
    );
  }
}
