import 'package:dio/dio.dart';
import 'package:http_test/api/api.dart';
import 'package:http_test/model/cat.dart';
import 'package:http/http.dart' as http;

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
      // print(result.data.runtimeType);
      return result.data;
    }
  }
}
