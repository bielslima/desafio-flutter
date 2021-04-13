import 'dart:async';

import 'package:popcode_challenge_swapi/data/models/species-model/specie.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/Specie/specie-repository.dart';

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
