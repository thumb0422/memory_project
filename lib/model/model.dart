/**
 * 数据模型、枚举
**/
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Model {
  int id;
  @required
  @JsonKey(name: 'dataType')
  String typeId = '';
  String account = '';
  String accountUrl = '';
  @JsonKey(name: 'accountPWD')
  String accountPwd = '';
  String accountDesc = '';

  Model(typeId,account,accountUrl, accountPwd,accountDesc) {
    this.typeId = typeId;
    this.account = account;
    this.accountUrl = accountUrl;
    this.accountPwd = accountPwd;
    this.accountDesc = accountDesc;
  }

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
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

  //不同的类使用不同的mixin即可
  factory TypeModel.fromJson(Map<String, dynamic> json) => _$TypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TypeModelToJson(this);
}
