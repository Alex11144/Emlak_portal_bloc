import 'package:database_trial/domain/entitites/settlmenets/settlemenets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'regions_settlements.g.dart';

@JsonSerializable(explicitToJson: true)
class SettlementsAndRegions {
  final int? regionId;
  final String? regionName;
  final List? settlementDto;

  SettlementsAndRegions(
      {required this.regionId,
      required this.regionName,
      required this.settlementDto});

  factory SettlementsAndRegions.fromJson(Map<String, dynamic> json) =>
      _$SettlementsAndRegionsFromJson(json);

  Map<String, dynamic> toJson() => _$SettlementsAndRegionsToJson(this);
}
