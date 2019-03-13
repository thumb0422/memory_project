/*
 * Copyright (c) 2019  All Rights Reserved.
 * Date: 3/13/19 1:30 PM
 * FileName: splashPage.dart
 * Author : thumb0422@163.com
 * Version: 1.0
 */

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Text('splashPage',style: TextStyle(color: Colors.red,fontSize: 25),),
        ));
  }
}
