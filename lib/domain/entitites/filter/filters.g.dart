// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryParameters _$QueryParametersFromJson(Map<String, dynamic> json) =>
    QueryParameters(
      floorCount: json['floorCount'],
      announceType: json['announceType'],
      currentFloor: json['currentFloor'],
      roomCount: json['roomCount'],
      pageNumber: json['pageNumber'],
      kredit: json['kredit'],
      document: json['document'],
      propertyType: json['propertyType'],
      metroId: json['metroId'],
      markId: json['markId'],
      regionId: json['regionId'],
      settlementId: json['settlementId'],
      cityId: json['cityId'],
      announcer: json['announcer'],
      noFirstFloor: json['noFirstFloor'],
      noTopFloor: json['noTopFloor'],
      isTopFloor: json['isTopFloor'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      minSpace: json['minSpace'],
      maxSpace: json['maxSpace'],
    );

Map<String, dynamic> _$QueryParametersToJson(QueryParameters instance) =>
    <String, dynamic>{
      'floorCount': instance.floorCount,
      'announceType': instance.announceType,
      'pageNumber': instance.pageNumber,
      'kredit': instance.kredit,
      'document': instance.document,
      'propertyType': instance.propertyType,
      'cityId': instance.cityId,
      'announcer': instance.announcer,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'minSpace': instance.minSpace,
      'maxSpace': instance.maxSpace,
      'noFirstFloor': instance.noFirstFloor,
      'noTopFloor': instance.noTopFloor,
      'isTopFloor': instance.isTopFloor,
      'currentFloor': instance.currentFloor,
      'roomCount': instance.roomCount,
      'metroId': instance.metroId,
      'markId': instance.markId,
      'regionId': instance.regionId,
      'settlementId': instance.settlementId,
    };
