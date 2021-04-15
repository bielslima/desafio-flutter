import 'package:dio/dio.dart';

import '../../../data/models/models.dart';
import '../../../data/models/query-planets-mode/query-planets.dart';
import '../../../domain/usecases/save-planets-local-storage/save-planets-local-storage.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/Planet/planet-repository.dart';

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
