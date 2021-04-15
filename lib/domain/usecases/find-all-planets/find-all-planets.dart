import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/data/models/models.dart';
import 'package:popcode_challenge_swapi/data/models/query-planets-mode/query-planets.dart';
import 'package:popcode_challenge_swapi/domain/usecases/save-planets-local-storage/save-planets-local-storage.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/Planet/planet-repository.dart';

class FindAllPlanets {
  static Future execute() async {
    try {
      QueryPlanets qryPlanets = QueryPlanets(
          0,
          InfraConstants.BASE_URL_SWAPI + InfraConstants.ENDPOINT_PLANETS,
          '', []);
      List<Planet> planets = [];

      while (qryPlanets.next != '') {
        Response response =
            await getIt<PlanetRepository>().findFromUrl(qryPlanets.next);

        if (response.statusCode == 200) {
          qryPlanets = QueryPlanets.fromJson(response.data);
          planets.addAll(qryPlanets.results);
        }
      }

      await SavePlanetsLocalStorage.execute(planets);
    } catch (e) {
      throw e;
    }
  }
}
