import 'package:json_annotation/json_annotation.dart';
part 'get.g.dart';

@JsonSerializable()
class Houses {
  @JsonKey(disallowNullValue: false)
  int? id;
  @JsonKey(disallowNullValue: false)
  final String? propertyType;
  @JsonKey(disallowNullValue: false)
  final String? cover;
  @JsonKey(disallowNullValue: false)
  final int price;
  @JsonKey(disallowNullValue: false)
  final String? space;
  @JsonKey(disallowNullValue: false)
  final int? roomCount;
  @JsonKey(disallowNullValue: false)
  final String? address;
  @JsonKey(disallowNullValue: false)
  final String? announceDate;

  Houses({
    required this.id,
    required this.propertyType,
    required this.cover,
    required this.price,
    required this.space,
    required this.roomCount,
    required this.address,
    required this.announceDate,
  });

  factory Houses.fromJson(Map<String, dynamic> json) => _$HousesFromJson(json);

  Map<String, dynamic> toJson() => _$HousesToJson(this);
}
