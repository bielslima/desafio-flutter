import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/data/models/planet-model/planet.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/Planet/planet-repository.dart';

class FindPlanetRemote {
  static Future<Planet> execute(String endpoint) async {
    try {
      Response response =
          await getIt<PlanetRepository>().findPlanetRemote(endpoint);

      if (response.statusCode == 200) return Planet.fromJson(response.data);
      throw 'Failed to fetch planet data.';
    } catch (e) {
      throw e;
    }
  }
}
