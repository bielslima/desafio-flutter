import 'package:dio/dio.dart';

import '../../../data/models/planet-model/planet.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/Planet/planet-repository.dart';

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
