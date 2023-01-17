// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regions_settlements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettlementsAndRegions _$SettlementsAndRegionsFromJson(
        Map<String, dynamic> json) =>
    SettlementsAndRegions(
      regionId: json['regionId'] as int?,
      regionName: json['regionName'] as String?,
      settlementDto: json['settlementDto'] as List<dynamic>?,
    );

Map<String, dynamic> _$SettlementsAndRegionsToJson(
        SettlementsAndRegions instance) =>
    <String, dynamic>{
      'regionId': instance.regionId,
      'regionName': instance.regionName,
      'settlementDto': instance.settlementDto,
    };
