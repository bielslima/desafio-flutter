import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../data/http/http-client.dart';
import '../../../infra/dependency-injection/injectable.dart';

abstract class IPlanetRepository {
  Future<Response> findPlanetRemote(String endpoint);
  Future findPlanetLocal(String endpoint);
}

@injectable
class PlanetRepository implements IPlanetRepository {
  Future<Response> findPlanetRemote(String endpoint) async {
    return getIt<HttpClient>().httpGet(
      endpoint,
    );
  }

  Future<Response> findFromUrl(String url) async {
    return getIt<HttpClient>().httpGet(
      url,
    );
  }

  Future<dynamic> findPlanetLocal(String endpoint) async {
    return getIt<HttpClient>().httpGet(
      endpoint,
    );
  }
}
