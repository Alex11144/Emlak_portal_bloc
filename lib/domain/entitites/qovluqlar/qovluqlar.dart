import 'package:json_annotation/json_annotation.dart';
part 'qovluqlar.g.dart';

@JsonSerializable()
class QovluqlarList {
  @JsonKey(disallowNullValue: false)
  final int? listId;
  @JsonKey(disallowNullValue: false)
  final String? listName;
  @JsonKey(disallowNullValue: false)
  final int? announceCount;
  @JsonKey(disallowNullValue: false)
  bool? isChecked;
  QovluqlarList({
    this.isChecked,
    required this.listId,
    required this.listName,
    required this.announceCount,
  });

  factory QovluqlarList.fromJson(Map<String, dynamic> json) =>
      _$QovluqlarListFromJson(json);

  Map<String, dynamic> toJson() => _$QovluqlarListToJson(this);
}
