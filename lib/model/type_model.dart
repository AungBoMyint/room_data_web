import 'package:json_annotation/json_annotation.dart';
import 'package:stayria_frontend/model/room_detail.dart';

part 'type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TypeModel {
  final String code;
  final String description;
  final int inventory;
  final List<RoomDetail> data;
  TypeModel(
      {required this.code,
      required this.description,
      required this.inventory,
      required this.data});

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TypeModelToJson(this);
}
