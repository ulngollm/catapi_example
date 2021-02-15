import 'package:dio/dio.dart';

class Api {
  static Dio api = Dio(
    BaseOptions(headers: {"x-api-key": "5c1568dd-4870-457f-9f4e-b5a91c6de0d5"}),
  );
}
