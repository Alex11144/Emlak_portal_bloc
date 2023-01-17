import 'package:json_annotation/json_annotation.dart';
part 'detailsWidget.g.dart';

@JsonSerializable()
class Details {
  @JsonKey(disallowNullValue: false)
  final String? propertyType;
  @JsonKey(disallowNullValue: false)
  final String? space;
  @JsonKey(disallowNullValue: false)
  final int? floorCount;
  @JsonKey(disallowNullValue: false)
  final int? currentFloor;
  @JsonKey(disallowNullValue: false)
  final int? price;
  @JsonKey(disallowNullValue: false)
  final String? metro;
  @JsonKey(disallowNullValue: false)
  final String? settlement;
  @JsonKey(disallowNullValue: false)
  final String? city;
  @JsonKey(disallowNullValue: false)
  final String? region;
  @JsonKey(disallowNullValue: false)
  final String? logoImages;
  @JsonKey(disallowNullValue: false)
  final String? text;
  @JsonKey(disallowNullValue: false)
  final String? address;
  @JsonKey(disallowNullValue: false)
  final String? owner;
  @JsonKey(disallowNullValue: false)
  final String? mobile;
  @JsonKey(disallowNullValue: false)
  final String? ownerType;
  @JsonKey(disallowNullValue: false)
  final int? roomCount;
  @JsonKey(disallowNullValue: false)
  final String? parserSite;
  @JsonKey(disallowNullValue: false)
  final String? announceDate;

  Details({
    required this.propertyType,
    required this.space,
    required this.floorCount,
    required this.currentFloor,
    required this.price,
    required this.metro,
    required this.settlement,
    required this.city,
    required this.region,
    required this.logoImages,
    required this.text,
    required this.address,
    required this.owner,
    required this.mobile,
    required this.ownerType,
    required this.roomCount,
    required this.parserSite,
    required this.announceDate,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
