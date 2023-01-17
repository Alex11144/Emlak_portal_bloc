import 'package:json_annotation/json_annotation.dart';
part 'announces_entity.g.dart';

AnnouncesEntity announcesEntity = AnnouncesEntity();

@JsonSerializable()
class AnnouncesEntity {
  @JsonKey(disallowNullValue: false)
  String? id;
  @JsonKey(disallowNullValue: false)
  String? isFromSearch = 'false';
  AnnouncesEntity({this.id, this.isFromSearch});

  factory AnnouncesEntity.fromJson(Map<String, dynamic> json) =>
      _$AnnouncesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncesEntityToJson(this);
}
