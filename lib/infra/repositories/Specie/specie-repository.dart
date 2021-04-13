import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/http/http-client.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

abstract class ISpecieRepository {
  Future findSpecieRemote(String endpoint);
  Future findSpecieLocal(String endpoint);
  Future findSpeciesRemote(List<String> endpoints);
}

@injectable
class SpecieRepository implements ISpecieRepository {
  Future<dynamic> findSpecieRemote(String endpoint) async {
    return getIt<HttpClient>().httpGet(
      endpoint,
    );
  }

  Future<dynamic> findSpecieLocal(String endpoint) async {
    return getIt<HttpClient>().httpGet(
      endpoint,
    );
  }

  Future<dynamic> findSpeciesRemote(List<String> endpoints) async {
    return getIt<HttpClient>().multipleHttpGet(
      endpoints,
    );
  }
}
