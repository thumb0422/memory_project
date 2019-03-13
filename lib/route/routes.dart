/*
 * Copyright (c) 2019  All Rights Reserved.
 * Date: 3/13/19 3:16 PM
 * FileName: routes.dart
 * Author : thumb0422@163.com
 * Version: 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './route-handle.dart';

class Routes{
  static String splash = '/splash';
  static String home = '/';
  static String add = '/add';
  static String list = '/list';
  static String detail = '/detail';

  static void configureRoutes(Router router){
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        print('I can not found!');
      }
    );
    router.define(splash, handler: splashHandle);
    router.define(home, handler: homeHandle);
    router.define(list, handler: listHandle);
    router.define(add, handler: addHandle);
    router.define(detail, handler: detailHandle);
  }
}