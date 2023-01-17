import 'dart:convert';
import 'dart:io';
import 'package:database_trial/domain/entitites/getter/get.dart';
import 'package:database_trial/domain/entitites/qovluqlar/qovluqlar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class QovluqlarApiClient {
  final _client = HttpClient();
  int page = 1;
  // final qovluqlarSecure = QovluqlarData().nameQovluqTextController;
  TextEditingController nameQovluqTextController = TextEditingController();

  final secureStorage = const FlutterSecureStorage();
  // final security = QovluqlarSecureStorage();
  Future<dynamic> createList() async {
    // final qovluqName = await secureStorage.read(key: 'qovluqName');
    final token = await secureStorage.read(key: 'token');
    // final code = await secureStorage.read(key: 'code');
    const url = 'https://rieltorofisi.com/api/Rieltor/create-list';
    final parameters = <String, dynamic>{
      'listName': nameQovluqTextController.text
    };
    final request = await _client.postUrl(Uri.parse(url));
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final json1 = (await response.jsonDecode()) as Map<String, dynamic>;
    final listId = json1['listId'];
    final qovluqName = json1['qovluqName'];

    await secureStorage.write(key: 'listId', value: listId.toString());
    await secureStorage.write(key: 'qovluqName', value: qovluqName);

    showLists();
    return json1;
  }

  Future<dynamic> addOrRemoveFromList(id, listId) async {
    // final listid = await secureStorage.read(key: 'listId');
    final token = await secureStorage.read(key: 'token');
    // final code = await secureStorage.read(key: 'code');
    const url = 'https://rieltorofisi.com/api/Rieltor/add-or-remove-item-list';
    final parameters = <String, dynamic>{'announceId': id, 'listId': listId};
    final request = await _client.postUrl(Uri.parse(url));
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    request.write(jsonEncode(parameters));
    final response = await request.close();
    // final json1 = (await response.jsonDecode()) as Map<String, dynamic>;
    // final listId = json1['listId'];
    // await secureStorage.write(key: 'listId', value: listId.toString());
    // print(await secureStorage.read(key: 'listId'));
    return response;
  }

  Future<dynamic> deleteQovluq(listId) async {
    // final listid = await secureStorage.read(key: 'listId');
    // print(listid);

    final token = await secureStorage.read(key: 'token');
    // final code = await secureStorage.read(key: 'code');
    const url = 'https://rieltorofisi.com/api/Rieltor/remove-list';
    final parameters = <String, dynamic>{
      'listId': int.parse(listId.toString()),
    };
    final request = await _client.deleteUrl(Uri.parse(url));
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json1 = (await response.jsonDecode()) as Map<String, dynamic>;
    // await secureStorage.delete(key: 'listId');
    // lis
    // final listId = json1['listId'];
    // await secureStorage.write(key: 'listId', value: listId.toString());
    // print(await secureStorage.read(key: 'listId'));
    return json1;
  }

  Future<dynamic> showLists() async {
    const url = 'https://rieltorofisi.com/api/Rieltor/lists';
    final token = await secureStorage.read(key: 'token');
    final request = await _client.getUrl(Uri.parse(url));
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    try {
      final response = await request.close();
      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      final json = jsonDecode(jsonString) as List<dynamic>;
      final params = json
          .map((dynamic e) => QovluqlarList.fromJson(e as Map<String, dynamic>))
          .toList();
      // final listId = json1['listId'];
      // await secureStorage.write(key: 'listId', value: listId.toString());
      // print(await secureStorage.read(key: 'listId'));
      return params;
    } catch (e) {}
  }

  Future<dynamic> getHouses(listId) async {
    final url = Uri.parse(
        'https://rieltorofisi.com/api/Rieltor/single-list?ListId=$listId&PageNumber=$page&PageSize=200');
    final token = await secureStorage.read(key: 'token');
    final request = await _client.getUrl(url);
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    // request.write(jsonEncode(parameters));
    try {
      final response = await request.close();

      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      final json = jsonDecode(jsonString) as List<dynamic>;
      final params = json
          .map((dynamic e) => Houses.fromJson(e as Map<String, dynamic>))
          .toList();
      return params;
    } catch (e) {}
  }

  Future<dynamic> getFolderById(id) async {
    final url = Uri.parse(
        'https://rieltorofisi.com/api/Rieltor/get-folders-by-announce?announceId=$id');
    final token = await secureStorage.read(key: 'token');
    final request = await _client.getUrl(url);
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    // request.write(jsonEncode(parameters));
    try {
      final response = await request.close();

      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      final json = jsonDecode(jsonString) as List<dynamic>;
      final params = json
          .map((dynamic e) => QovluqlarList.fromJson(e as Map<String, dynamic>))
          .toList();
      // print(json);
      // print(params);
      return params;
    } catch (e) {}
  }
}

extension HttpClientResponseJsonDecodeQovluqlar on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value));
  }
}
