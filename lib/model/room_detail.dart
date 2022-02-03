import 'package:json_annotation/json_annotation.dart';

part 'room_detail.g.dart';

@JsonSerializable()
class RoomDetail {
  String date;
  int percent;
  @JsonKey(name: "num0")
  int outOfOrder;

  @JsonKey(name: "num1")
  int available;

  @JsonKey(name: "num2")
  int specialAvailable;

  @JsonKey(name: "num3")
  int soldOnline;

  @JsonKey(name: "num4")
  int sold;

  @JsonKey(name: "num5")
  int overBooked;
  RoomDetail({
    required this.date,
    required this.percent,
    required this.outOfOrder,
    required this.available,
    required this.specialAvailable,
    required this.soldOnline,
    required this.sold,
    required this.overBooked,
  });

  factory RoomDetail.fromJson(Map<String, dynamic> json) =>
      _$RoomDetailFromJson(json);
  Map<String, dynamic> toJson() => _$RoomDetailToJson(this);
}
