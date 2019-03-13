/*
 * Copyright (c) 2019  All Rights Reserved.
 * Date: 3/13/19 1:30 PM
 * FileName: splashPage.dart
 * Author : thumb0422@163.com
 * Version: 1.0
 */

import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import '../route/application.dart';
import '../route/routes.dart';
import '../route/routeDefine.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(
                'splashPage',
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                  child: Text('Skip', style: TextStyle(color: Colors.yellow, fontSize: 25)),
                  color: Colors.red,
                  onPressed: () {
                    Application.router.navigateTo(context, Routes.home,
                        transition: TransitionType.inFromBottom);
                  })
            ],
          ),
        ));
  }
}
