// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomDetail _$RoomDetailFromJson(Map<String, dynamic> json) => RoomDetail(
      date: json['date'] as String,
      percent: json['percent'] as int,
      outOfOrder: json['num0'] as int,
      available: json['num1'] as int,
      specialAvailable: json['num2'] as int,
      soldOnline: json['num3'] as int,
      sold: json['num4'] as int,
      overBooked: json['num5'] as int,
    );

Map<String, dynamic> _$RoomDetailToJson(RoomDetail instance) =>
    <String, dynamic>{
      'date': instance.date,
      'percent': instance.percent,
      'num0': instance.outOfOrder,
      'num1': instance.available,
      'num2': instance.specialAvailable,
      'num3': instance.soldOnline,
      'num4': instance.sold,
      'num5': instance.overBooked,
    };
