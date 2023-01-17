// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qovluqlar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QovluqlarList _$QovluqlarListFromJson(Map<String, dynamic> json) =>
    QovluqlarList(
      isChecked: json['isChecked'] as bool?,
      listId: json['listId'] as int?,
      listName: json['listName'] as String?,
      announceCount: json['announceCount'] as int?,
    );

Map<String, dynamic> _$QovluqlarListToJson(QovluqlarList instance) =>
    <String, dynamic>{
      'listId': instance.listId,
      'listName': instance.listName,
      'announceCount': instance.announceCount,
      'isChecked': instance.isChecked,
    };
