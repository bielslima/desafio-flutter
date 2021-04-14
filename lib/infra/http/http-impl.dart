import 'package:injectable/injectable.dart';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../../data/http/http.dart';
import 'interceptor.dart';

@Injectable(
  as: HttpClient,
)
class HttpImpl implements HttpClient {
  final Dio dio = Dio()..interceptors.add(HttpInterceptors());

  _makeOptions(Map<String, String> headers, Map<String, dynamic> queryParams) {
    this.dio.options = BaseOptions(
      headers: _makeHeaders(headers),
      queryParameters: queryParams,
      validateStatus: (status) {
        if (status != null) return status < 500;
        return false;
      },
    );
  }

  Map<String, String> _makeHeaders(Map<String, String> headers) {
    final Map<String, String> _headers = headers
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
    Map<String, String>? headers,
  }) async {
    try {
      this._makeOptions(headers ?? {}, queryParameters ?? {});

      return dio.get(path);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> httpPost(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      this._makeOptions(headers ?? {}, queryParameters ?? {});

      return dio.post(
        path,
        data: body ?? {},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> multipleHttpGet(
    List<String> endPoints, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      this._makeOptions(headers ?? {}, queryParameters ?? {});

      List response = await Future.wait(
        endPoints
            .map(
              (String endPointToGet) => dio.get(
                endPointToGet,
              ),
            )
            .toList(),
      );

      return response.map((e) => e.data).toList();
    } catch (e) {
      rethrow;
    }
  }
}
