import 'dart:convert';
import 'dart:io';
import 'package:database_trial/domain/entitites/details/detailsWidget.dart';
import 'package:database_trial/domain/entitites/getter/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../entitites/announces_entity/announces_entity.dart';

class ApiClient {
  final client = HttpClient();
  int page = 1;
  final secureStorage = FlutterSecureStorage();

  Future<dynamic> getDetailsImages(id) async {
    try {
      var url = 'https://rieltorofisi.com/api/Announce/announces';
      announcesEntity.id = id.toString();
      var queryString =
          Uri.parse(url).replace(queryParameters: announcesEntity.toJson());
      final request = await client.getUrl(queryString);
      final token = await secureStorage.read(key: 'token');
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();

      final json = await response.jsonDecode();
      final json1 = json["logoImages"];
      final json2 = jsonDecode(json1);
      return json2;
    } catch (e) {}
  }

  Future<dynamic> getDetails(id) async {
    var url = 'https://rieltorofisi.com/api/Announce/announces';
    announcesEntity.id = id.toString();
    var queryString =
        Uri.parse(url).replace(queryParameters: announcesEntity.toJson());
    final request = await client.getUrl(queryString);
    final token = await secureStorage.read(key: 'token');
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    final response = await request.close();

    final json = await response.jsonDecode();
    final fromJson = Details.fromJson(json);

    return fromJson;
  }

  Future<dynamic> announcesForSale() async {
    final url = Uri.parse('https://rieltorofisi.com/api/Home/index');
    try {
      final request = await client.getUrl(url);
      final token = await secureStorage.read(key: 'token');
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();
      final json = await response.jsonDecode();
      final json1 = json["announcesForSale"];
      // final json2 = json["announcesCount"];
      final house = json1
          .map((dynamic e) => Houses.fromJson(e as Map<String, dynamic>))
          .toList();
      return house;
    } catch (e) {}
  }

  Future<dynamic> announcesForRent() async {
    final url = Uri.parse('https://rieltorofisi.com/api/Home/index');
    try {
      final request = await client.getUrl(url);
      final token = await secureStorage.read(key: 'token');
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();
      final json = await response.jsonDecode();
      final json1 = json["announcesForRent"];
      // final json2 = json["announcesCount"];
      final house = json1
          .map((dynamic e) => Houses.fromJson(e as Map<String, dynamic>))
          .toList();
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
