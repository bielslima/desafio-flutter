import 'package:popcode_challenge_swapi/data/local-storage/local-storage.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class RemovePeopleFavorite {
  static Future execute(String idPeople) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      await localStorage.delete(
        boxName: InfraConstants.HIVE_BOX_FAVORITES,
        key: idPeople,
      );

      await localStorage.delete(
        boxName: InfraConstants.HIVE_BOX_QUEUEFAVORITES,
        key: idPeople,
      );
    } catch (e) {
      rethrow;
    }
  }
}
