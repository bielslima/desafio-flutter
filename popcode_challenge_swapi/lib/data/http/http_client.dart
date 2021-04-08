import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class HttpClient {
  Future<Response> httpGet({
    @required String path,
    Map body,
    Map queryParameters,
    Map headers,
  });

  Future<Response> httpPost({
    @required String path,
    Map body,
    Map queryParameters,
    Map headers,
  });
}
