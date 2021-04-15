import 'dart:async';

import '../../../data/models/species-model/specie.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/Specie/specie-repository.dart';

class FindSpeciesRemote {
  static Future execute(List<String> endpoints) async {
    return getIt<SpecieRepository>().findSpeciesRemote(endpoints).then(
          (data) => data
              .map((e) => Specie.fromJson(
                    e,
                  ))
              .toList(),
        );
  }
}
