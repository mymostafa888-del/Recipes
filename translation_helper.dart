import 'package:dio/dio.dart';

class TranslationHelper {
  static final dio = Dio();

  static Future<List<String>> translateList(List items) async {
    List<String> result = [];

    for (var item in items) {
      try {
        final response = await dio.get(
          'https://api.mymemory.translated.net/get',
          queryParameters: {
            'q': item.toString(),
            'langpair': 'en|ar',
          },
        );

        result.add(
          response.data['responseData']['translatedText'] ??
              item.toString(),
        );
      } catch (e) {
        result.add(item.toString());
      }
    }

    return result;
  }
}