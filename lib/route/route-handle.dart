/*
 * Copyright (c) 2019  All Rights Reserved.
 * Date: 3/13/19 3:25 PM
 * FileName: route-handle.dart
 * Author : thumb0422@163.com
 * Version: 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../page/homePage.dart';
import '../page/addPage.dart';
import '../page/listPage.dart';
import '../page/detailPage.dart';
import '../page/splashPage.dart';
//import '../model/model.dart';

var homeHandle = Handler(
  handlerFunc: (BuildContext context,Map<String, List<String>> params){
      return HomePage();
  }
);

var addHandle = Handler(
  handlerFunc:  (BuildContext context,Map<String, List<String>> params){
    return AddPage();
  }
);

var listHandle = Handler(
    handlerFunc:  (BuildContext context,Map<String, List<String>> params){
      return ListPage();
    }
);

var detailHandle = Handler(
    handlerFunc:  (BuildContext context,Map<String, List<String>> params){
      return DetailPage();
    }
);

var splashHandle = Handler(
    handlerFunc:  (BuildContext context,Map<String, List<String>> params){
      return SplashPage();
    }
);