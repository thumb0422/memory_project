/**
 * 数据模型、枚举
**/
import 'package:flutter/material.dart';
import 'package:json_parser/reflectable.dart';

@reflectable
class Model {
  @required String typeId = '';
  @required String typeName = '';
  String imgName = '';
  String desc = '';

  Model(typeId,typeName,imgName,desc){
    this.typeId = typeId;
    this.typeName = typeName;
    this.imgName = imgName;
    this.desc = desc;
  }
}

@reflectable
class TypeModel {
  String code = '';
  String name = '';
  String icon = '';

  TypeModel(code,name,icon){
    this.code = code;
    this.name = name;
    this.icon = icon;
  }
}
