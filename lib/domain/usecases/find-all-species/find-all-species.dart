import 'package:dio/dio.dart';

import '../../../data/models/models.dart';
import '../../../data/models/query-species-model/query-species.dart';
import '../../../domain/usecases/save-species-local-storage/save-species-local-storage.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/People/people-repository.dart';

class FindAllSpecies {
  static Future execute() async {
    PeopleRepository repository = getIt<PeopleRepository>();
    try {
      QuerySpecies qrySpecies = QuerySpecies(
          0,
          InfraConstants.BASE_URL_SWAPI + InfraConstants.ENDPOINT_SPECIES,
          '', []);
      List<Specie> species = [];

      while (qrySpecies.next != '') {
        Response response = await repository.findFromUrl(qrySpecies.next);

        if (response.statusCode == 200) {
          qrySpecies = QuerySpecies.fromJson(response.data);
          species.addAll(qrySpecies.results);
        }
      }

      await SaveSpeciesLocalStorage.execute(species);
    } catch (e) {
      throw e;
    }
  }
}
