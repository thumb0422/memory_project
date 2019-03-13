/*
 * Copyright (c) 2019  All Rights Reserved.
 * Date: 3/13/19 3:20 PM
 * FileName: routeDefine.dart
 * Author : thumb0422@163.com
 * Version: 1.0
 */

import 'package:fluro/fluro.dart';
import './application.dart';
import './routes.dart';

void initRoutes() {
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;
}
