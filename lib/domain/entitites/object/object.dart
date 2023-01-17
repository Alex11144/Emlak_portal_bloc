import 'package:database_trial/domain/entitites/getter/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'object.g.dart';

@JsonSerializable(explicitToJson: true)
class ListFormObject {
  final List<Houses> announcesDto;
  final int announcesCount;

  ListFormObject({required this.announcesDto, required this.announcesCount});

  factory ListFormObject.fromJson(Map<String, dynamic> json) =>
      _$ListFormObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ListFormObjectToJson(this);
}
