import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';

import '../../data/http/http.dart';

class HttpImpl implements HttpClient {
  final Dio client;

  HttpImpl(this.client) {
    this.client.options = BaseOptions(
      baseUrl: Constants.BASE_URL_SWAPI,
    );
  }

  Map<String, dynamic> _makeHeaders(Map<String, dynamic> headers) {
    final Map<String, dynamic> _headers = headers?.cast<String, String>() ?? {}
      ..addAll(
        {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );
    return _headers;
  }

  Future<Response> httpGet({
    @required String path,
    Map body,
    Map queryParameters,
    Map headers,
  }) {
    return this.client.get(path,
        queryParameters: queryParameters ?? {},
        options: Options(
          headers: this._makeHeaders(headers),
        ));
  }

  Future<Response> httpPost({
    @required String path,
    Map body,
    Map queryParameters,
    Map headers,
  }) {
    return this.client.post(path,
        queryParameters: queryParameters ?? {},
        data: body ?? {},
        options: Options(
          headers: this._makeHeaders(headers),
        ));
  }
}
