import 'package:json_annotation/json_annotation.dart';
import 'package:stayria_frontend/model/type_model.dart';

part 'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DataModal {
  final List<TypeModel> data;
  DataModal({required this.data});

  factory DataModal.fromJson(Map<String, dynamic> json) =>
      _$DataModalFromJson(json);
  Map<String, dynamic> toJson() => _$DataModalToJson(this);
}
