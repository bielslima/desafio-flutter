import 'package:popcode_challenge_swapi/data/local-storage/local-storage.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class VerifyPeopleFavorite {
  static Future<bool> execute(String idPeople) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      People? people = await localStorage.find(
          boxName: InfraConstants.HIVE_BOX_FAVORITES, key: idPeople);

      return people == null ? false : true;
    } catch (e) {
      rethrow;
    }
  }
}
