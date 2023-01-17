// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settlemenets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettlementsForAnnounces _$SettlementsForAnnouncesFromJson(
        Map<String, dynamic> json) =>
    SettlementsForAnnounces(
      settlementId: json['settlementId'] as int?,
      settlementName: json['settlementName'] as String?,
    );

Map<String, dynamic> _$SettlementsForAnnouncesToJson(
        SettlementsForAnnounces instance) =>
    <String, dynamic>{
      'settlementId': instance.settlementId,
      'settlementName': instance.settlementName,
    };
