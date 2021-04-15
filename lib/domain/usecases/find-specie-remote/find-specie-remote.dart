import '../../../data/models/species-model/specie.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/Specie/specie-repository.dart';

class FindSpecieRemote {
  static Future<Specie> execute(String endpoint) async {
    return getIt<SpecieRepository>().findSpecieRemote(endpoint).then(
          (data) => Specie.fromJson(
            data,
          ),
        );
  }
}
