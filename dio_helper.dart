import 'package:dio/dio.dart';

class DioHelper {
  static final dio = Dio();

  static Future<List> getData() async {
    final response = await dio.get(
      'https://dummyjson.com/recipes',
    );

    return response.data['recipes'];
  }
}