// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(json['dataType'], json['account'], json['accountUrl'],
      json['accountPWD'], json['accountDesc'])
    ..id = json['id'] as int;
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'dataType': instance.typeId,
      'account': instance.account,
      'accountUrl': instance.accountUrl,
      'accountPWD': instance.accountPwd,
      'accountDesc': instance.accountDesc
    };

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) {
  return TypeModel(json['code'], json['name'], json['icon']);
}

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'icon': instance.icon
    };
