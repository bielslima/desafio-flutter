import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/http/http-client.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

abstract class IPlanetRepository {
  Future findPlanetRemote(String endpoint);
  Future findPlanetLocal(String endpoint);
}

@injectable
class PlanetRepository implements IPlanetRepository {
  Future<dynamic> findPlanetRemote(String endpoint) async {
    return getIt<HttpClient>().httpGet(
      endpoint,
    );
  }

  Future<dynamic> findPlanetLocal(String endpoint) async {
    return getIt<HttpClient>().httpGet(
      endpoint,
    );
  }
}
