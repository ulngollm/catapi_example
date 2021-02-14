import 'package:dio/dio.dart';

class CatApi {
  static Future<List<dynamic>> getCatsList() async {
    final result = await Dio().get(
      'https://api.thecatapi.com/v1/images/search',
      queryParameters: {
        "limit":"10"
      },
      options: Options(
          headers: {"x-api-key": "5c1568dd-4870-457f-9f4e-b5a91c6de0d5"}),
    );
    if (result.statusCode == 200) {
      return result.data;
    }
  }
}
