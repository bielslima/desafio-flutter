import 'package:popcode_challenge_swapi/data/models/planet-model/planet.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/Planet/planet-repository.dart';

class FindPlanetRemote {
  static Future<Planet> execute(String endpoint) async {
    return getIt<PlanetRepository>().findPlanetRemote(endpoint).then(
          (data) => Planet.fromJson(
            data,
          ),
        );
  }
}
