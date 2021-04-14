import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response> httpGet(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<Response> httpPost(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> multipleHttpGet(
    List<String> endPoints, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
