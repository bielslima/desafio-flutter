import 'package:popcode_challenge_swapi/data/models/species-model/specie.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/Specie/specie-repository.dart';

class FindSpecieRemote {
  static Future<Specie> execute(String endpoint) async {
    return getIt<SpecieRepository>().findSpecieRemote(endpoint).then(
          (data) => Specie.fromJson(
            data,
          ),
        );
  }
}
