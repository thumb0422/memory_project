/**
 * 数据模型、枚举
**/
import 'package:flutter/material.dart';

class Model {
  final String typeId;
  final String typeName;
  final String desc;

  Model({this.typeId, this.typeName, this.desc});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      typeId: json['typeId'],
      typeName: json['typeName'],
      desc: json['desc'],
    );
  }
}
