import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';

import '../../data/http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(
  as: HttpClient,
)
class HttpImpl implements HttpClient {
  late Dio client;

  HttpImpl() {
    this.client = Dio();
    this.client.options = BaseOptions(
      baseUrl: InfraConstants.BASE_URL_SWAPI,
    );
  }

  Map<String, dynamic>? _makeHeaders(Map<String, dynamic> headers) {
    late final Map<String, dynamic> _headers = headers
      ..addAll(
        {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );
    return _headers;
  }

  Future<Response> httpGet(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return this.client.get(
          path,
          queryParameters: queryParameters ?? {},
          options: Options(
            headers: this._makeHeaders(headers ?? {}),
          ),
        );
  }

  Future<Response> httpPost(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return this.client.post(
          path,
          data: body ?? {},
          queryParameters: queryParameters ?? {},
          options: Options(
            headers: this._makeHeaders(headers ?? {}),
          ),
        );
  }
}
