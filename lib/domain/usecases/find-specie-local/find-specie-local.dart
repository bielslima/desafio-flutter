import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/data/models/models.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class FindSpecieLocal {
  static Future<Specie> execute(String id) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      Specie people = await localStorage.find<Specie>(
        boxName: InfraConstants.HIVE_BOX_SPECIE,
        key: id,
      );

      return people;
    } catch (e) {
      throw e;
    }
  }
}
