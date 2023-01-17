// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Houses _$HousesFromJson(Map<String, dynamic> json) => Houses(
      id: json['id'] ?? 0,
      propertyType: json['propertyType'] ?? '',
      cover: json['cover'] ?? '',
      price: json['price'] ?? 0,
      space: json['space'] ?? '',
      roomCount: json['roomCount'] ?? 0,
      address: json['address'] ?? '',
      announceDate: json['announceDate'] ?? '',
    );

Map<String, dynamic> _$HousesToJson(Houses instance) => <String, dynamic>{
      'id': instance.id,
      'propertyType': instance.propertyType,
      'cover': instance.cover,
      'price': instance.price,
      'space': instance.space,
      'roomCount': instance.roomCount,
      'address': instance.address,
      'announceDate': instance.announceDate,
    };
