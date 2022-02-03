// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) => TypeModel(
      code: json['code'] as String,
      description: json['description'] as String,
      inventory: json['inventory'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => RoomDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'inventory': instance.inventory,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
