import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filters.g.dart';

@JsonSerializable()
class QueryParameters {
  List<dynamic> floorCount = List.empty(growable: true);
  String announceType = '2';
  String pageNumber = '1';
  String kredit = '0';
  String document = '0';
  String? propertyType = '0';
  String? cityId = '1';
  String? announcer = '0';
  String? minPrice = '0';
  String? maxPrice = '2000000';
  String? minSpace = '0';
  String? maxSpace = '750';
  String? noFirstFloor = 'false';
  String? noTopFloor = 'false';
  String? isTopFloor = 'false';

  List<dynamic> currentFloor = List.empty(growable: true);
  List<dynamic> roomCount = List.empty(growable: true);
  List<dynamic> metroId = List.empty(growable: true);

  List<dynamic> markId = List.empty(growable: true);
  List<dynamic> regionId = List.empty(growable: true);

  List<dynamic> settlementId = List.empty(growable: true);
  QueryParameters(
      {floorCount,
      announceType,
      currentFloor,
      roomCount,
      pageNumber,
      kredit,
      document,
      propertyType,
      metroId,
      markId,
      regionId,
      settlementId,
      cityId,
      announcer,
      noFirstFloor,
      noTopFloor,
      isTopFloor,
      minPrice,
      maxPrice,
      minSpace,
      maxSpace});

  factory QueryParameters.fromJson(Map<String, dynamic> json) =>
      _$QueryParametersFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParametersToJson(this);

  @override
  String toString() => toJson().toString();
}
