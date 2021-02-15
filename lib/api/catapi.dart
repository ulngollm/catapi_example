import 'package:dio/dio.dart';

import 'api.dart';

class CatApi {
  static Future<List<dynamic>> getCatsList() async {
    final result = await Api.api.get(
        'https://api.thecatapi.com/v1/images/search',
        queryParameters: {"limit": "10"});

    if (result.statusCode == 200) {
      return result.data;
    }
  }
}
