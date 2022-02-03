// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModal _$DataModalFromJson(Map<String, dynamic> json) => DataModal(
      data: (json['data'] as List<dynamic>)
          .map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataModalToJson(DataModal instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
