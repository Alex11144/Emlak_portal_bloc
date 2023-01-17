// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFormObject _$ListFormObjectFromJson(Map<String, dynamic> json) =>
    ListFormObject(
      announcesDto: (json['announcesDto'] as List<dynamic>)
          .map((e) => Houses.fromJson(e as Map<String, dynamic>))
          .toList(),
      announcesCount: json['announcesCount'] as int,
    );

Map<String, dynamic> _$ListFormObjectToJson(ListFormObject instance) =>
    <String, dynamic>{
      'announcesDto': instance.announcesDto.map((e) => e.toJson()).toList(),
      'announcesCount': instance.announcesCount,
    };
