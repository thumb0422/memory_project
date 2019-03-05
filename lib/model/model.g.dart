// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(json['typeId'], json['typeName'], json['imgName'], json['desc']);
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'typeId': instance.typeId,
      'typeName': instance.typeName,
      'imgName': instance.imgName,
      'desc': instance.desc
    };

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) {
  return TypeModel(json['code'], json['name'], json['icon']);
}

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'icon': instance.icon
    };
