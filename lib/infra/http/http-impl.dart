import 'package:injectable/injectable.dart';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:popcode_challenge_swapi/infra/constants.dart';
import '../../data/http/http.dart';

@Injectable(
  as: HttpClient,
)
class HttpImpl implements HttpClient {
  final Dio dio = Dio();

  _makeOptions(Map<String, String> headers, Map<String, dynamic> queryParams) {
    this.dio.options = BaseOptions(
      headers: _makeHeaders(headers),
      queryParameters: queryParams,
    );
  }

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
      print("[GET] => $path");

      this._makeOptions(headers ?? {}, queryParameters ?? {});

      Response res = await dio.get(path);

      print("RES => ${res.statusCode}");

      if (res.statusCode == 200)
        return res.data;
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
      // print("[POST] => ${InfraConstants.BASE_URL_SWAPI}/$path");
      return {};
      // Response res = await Dio().post(
      //   Uri.https(InfraConstants.BASE_URL_SWAPI, path, queryParameters),
      //   body: body,
      //   headers: this._makeHeaders(headers ?? {}),
      // );
      // print("RES => ${res.statusCode}");
      // return jsonDecode(res.data);
    } catch (e) {
      print(e);
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

      List teste = await Future.wait(
        endPoints
            .map(
              (String endPointToGet) => dio.get(
                endPointToGet,
              ),
            )
            .toList(),
      );

      print("RESULTADO MULTIPLE REQUEST");

      teste.forEach((element) {
        print(element);
      });

      return [];
    } catch (e) {
      rethrow;
    }
  }
}
