import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:database_trial/domain/entitites/filter/filters.dart';
import 'package:database_trial/domain/entitites/getter/get.dart';
import 'package:database_trial/domain/entitites/marks/nisangah.dart';
import 'package:database_trial/domain/entitites/metros/metro.dart';
import 'package:database_trial/domain/entitites/seherler/seher.dart';
import 'package:database_trial/domain/entitites/settlements_regions/regions_settlements.dart';
import 'package:database_trial/domain/entitites/settlmenets/settlemenets.dart';
import 'package:database_trial/ui/axtaris/axtaris_list_widget.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FilterApiClient {
  final client = HttpClient();
  var endpointUrl = 'https://rieltorofisi.com/api/Announce/count-by-filter';
  // var queryParams = {
  //   'FloorCount': [],
  //   'AnnounceType': '2',
  //   'CurrentFloor': ['1', '2'],
  // };
  final secureStorage = FlutterSecureStorage();

  int page = 0;
  Future<dynamic> getMertebeSatilirCount() async {
    var queryString = Uri.parse(endpointUrl)
        .replace(queryParameters: queryParameters.toJson());
    final token = await secureStorage.read(key: 'token');

    final request = await client.getUrl(queryString);
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    try {
      final response = await request.close();
      // Timer(Duration(seconds: 1), () {
      //   request.abort();
      // });
      final json = await response.jsonDecode();

      // final house = json
      //     .map((dynamic e) => queryParameters.fromJson(e as Map<String, dynamic>))
      //     .toList();
      return json;
    } catch (e) {}

    // final json1 = json["announcesCount"];
  }

  Future<dynamic> getFilteredHouses() async {
    var url =
        'https://rieltorofisi.com/api/Announce/filtered-announces?PageNumber$page&PageSize=10';
    final token = await secureStorage.read(key: 'token');

    var queryString =
        Uri.parse(url).replace(queryParameters: queryParameters.toJson());

    final request = await client.getUrl(queryString);
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    try {
      final response = await request.close();

      final json = await response.jsonDecode();
      final json1 = json["announcesDto"];
      // final json2 = json["announcesCount"];
      final house = json1
          .map((dynamic e) => Houses.fromJson(e as Map<String, dynamic>))
          .toList();
      return house;
    } catch (e) {}
  }

  Future<dynamic> regionsAndSettlements() async {
    final url =
        Uri.parse('https://rieltorofisi.com/api/Area/regions-and-settlements');
    try {
      final request = await client.getUrl(url);
      final token = await secureStorage.read(key: 'token');
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();
      final json = await response.jsonDecode();
      // final json1 = json["regionId"];
      // final json2 = jsonDecode(json);
      // final json2 = json["announcesCount"];
      final house = json
          .map((dynamic e) =>
              SettlementsAndRegions.fromJson(e as Map<String, dynamic>))
          .toList();
      // final houses = house['settlementDto'];
      // settlements = house.settlementDto
      //     ?.map((e) =>
      //         SettlementsForAnnounces.fromJson(e as Map<String, dynamic>))
      //     .toList();
      return house;
    } catch (e) {}
  }

  Future<dynamic> settlements() async {
    final url =
        Uri.parse('https://rieltorofisi.com/api/Area/regions-and-settlements');
    try {
      final request = await client.getUrl(url);
      final token = await secureStorage.read(key: 'token');
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();
      final json = await response.jsonDecode() as List<dynamic>;
      final house = json
          .map((dynamic e) =>
              SettlementsAndRegions.fromJson(e as Map<String, dynamic>))
          .toList();
      final settlement = house.map((e) => e.settlementDto).toList();
      // final settlementDto = settlemet
      //     .map((dynamic e) =>
      //         SettlementsForAnnounces.fromJson(e as Map<String, dynamic>))
      //     .toList();
      // final mapper = settlementDto
      //     .map((dynamic e) =>
      //         SettlementsForAnnounces.fromJson(e as Map<String, dynamic>))
      //     .toList();

      return settlement;
    } catch (e) {}
  }

  Future<dynamic> metros() async {
    final url = Uri.parse('https://rieltorofisi.com/api/Area/metros');
    try {
      final request = await client.getUrl(url);
      final token = await secureStorage.read(key: 'token');
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();
      final json = await response.jsonDecode();
      // final json1 = json["regionId"];
      // final json2 = jsonDecode(json);
      // final json2 = json["announcesCount"];
      final house = json
          .map((dynamic e) => Metros.fromJson(e as Map<String, dynamic>))
          .toList();
      // final houses = house['settlementDto'];
      // settlements = house.settlementDto
      //     ?.map((e) =>
      //         SettlementsForAnnounces.fromJson(e as Map<String, dynamic>))
      //     .toList();
      return house;
    } catch (e) {}
  }

  Future<dynamic> seherler() async {
    final url = Uri.parse('https://rieltorofisi.com/api/Area/cities');
    try {
      final request = await client.getUrl(url);
      final token = await secureStorage.read(key: 'token');
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();
      final json = await response.jsonDecode();
      // final json1 = json["regionId"];
      // final json2 = jsonDecode(json);
      // final json2 = json["announcesCount"];
      final house = json
          .map((dynamic e) => Seherler.fromJson(e as Map<String, dynamic>))
          .toList();
      // final houses = house['settlementDto'];
      // settlements = house.settlementDto
      //     ?.map((e) =>
      //         SettlementsForAnnounces.fromJson(e as Map<String, dynamic>))
      //     .toList();
      return house;
    } catch (e) {}
  }

  Future<dynamic> nisangah() async {
    final url = Uri.parse('https://rieltorofisi.com/api/Area/marks');
    try {
      final request = await client.getUrl(url);
      final token = await secureStorage.read(key: 'token');
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();
      final json = await response.jsonDecode();
      // final json1 = json["regionId"];
      // final json2 = jsonDecode(json);
      // final json2 = json["announcesCount"];
      final house = json
          .map((dynamic e) => Nisangah.fromJson(e as Map<String, dynamic>))
          .toList();
      // final houses = house['settlementDto'];
      // settlements = house.settlementDto
      //     ?.map((e) =>
      //         SettlementsForAnnounces.fromJson(e as Map<String, dynamic>))
      //     .toList();
      return house;
    } catch (e) {}
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value));
  }
}
