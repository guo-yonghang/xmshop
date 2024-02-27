import 'package:dio/dio.dart';

class HttpsClient {
  static String domain = 'https://miapp.itying.com';
  static Dio dio = Dio();

  HttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = const Duration(milliseconds: 5000);
    dio.options.receiveTimeout = const Duration(milliseconds: 5000);
  }

  Future get(apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      return null;
    }
  }

  static String replaceUrl(String url) {
    return '$domain/$url'.replaceAll('\\', '/');
  }
}
