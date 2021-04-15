import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/data/models/models.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/data/models/query-species-model/query-species.dart';
import 'package:popcode_challenge_swapi/domain/usecases/save-species-local-storage/save-species-local-storage.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

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
