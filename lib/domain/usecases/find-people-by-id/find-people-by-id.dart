import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class FindPeoplesByIdLocal {
  static Future<People> execute(String id) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      People people = await localStorage.find<People>(
        boxName: InfraConstants.HIVE_BOX_PEOPLE,
        key: id,
      );

      return people;
    } catch (e) {
      throw e;
    }
  }
}
