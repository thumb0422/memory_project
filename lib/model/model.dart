/**
 * 数据模型、枚举
**/
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

class Model {
  @required
  String typeId = '';
  @required
  String typeName = '';
  String imgName = '';
  String desc = '';

  Model(typeId, typeName, imgName, desc) {
    this.typeId = typeId;
    this.typeName = typeName;
    this.imgName = imgName;
    this.desc = desc;
  }
}

@JsonSerializable()
class TypeModel {
  String code = '';
  String name = '';
  String icon = '';

  TypeModel(code, name, icon) {
    this.code = code;
    this.name = name;
    this.icon = icon;
  }

//  TypeModel.fromJson(Map<String, dynamic> json)
//      : code = json['code'],
//        name = json['name'],
//        icon = json['icon'];
//
//  Map<String, dynamic> toJson() => {
//        'code': code,
//        'name': name,
//        'icon': icon,
//      };

  //不同的类使用不同的mixin即可
  factory TypeModel.fromJson(Map<String, dynamic> json) => _$TypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TypeModelToJson(this);
}
