/**
 * 数据模型、枚举
**/
import 'package:flutter/material.dart';
import 'package:json_parser/reflectable.dart';

@reflectable
class Model {
   @required String typeId;
   @required String typeName;
   @required String imgName;
   String desc = '';

  Model(typeId,typeName,imgName,desc){
    this.typeId = typeId;
    this.typeName = typeName;
    this.imgName = imgName;
    this.desc = desc;
  }

//  factory Model.fromJson(Map<String, dynamic> json) {
//    return Model(
//      typeId: json['typeId'],
//      typeName: json['typeName'],
//      desc: json['desc'],
//    );
//  }
}
