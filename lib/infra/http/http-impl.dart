import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import 'package:popcode_challenge_swapi/infra/constants.dart';
import '../../data/http/http.dart';

@Injectable(
  as: HttpClient,
)
class HttpImpl implements HttpClient {
  Map<String, String> _makeHeaders(Map<String, String> headers) {
    late final Map<String, String> _headers = headers
      ..addAll(
        {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );
    return _headers;
  }

  Future<dynamic> httpGet(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final Uri uri =
          Uri.https(InfraConstants.BASE_URL_SWAPI, path, queryParameters);
      print("[GET] => ${uri.toString()}");
      http.Response res = await http.get(
        uri,
        headers: this._makeHeaders(headers ?? {}),
      );
      print("RES => ${res.statusCode}");
      if (res.statusCode == 200)
        return jsonDecode(res.body);
      else
        throw 'Request status code: ${res.statusCode}';
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> httpPost(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      print("[POST] => ${InfraConstants.BASE_URL_SWAPI}/$path");
      http.Response res = await http.post(
        Uri.https(InfraConstants.BASE_URL_SWAPI, path, queryParameters),
        body: body,
        headers: this._makeHeaders(headers ?? {}),
      );
      print("RES => ${res.statusCode}");
      return jsonDecode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
