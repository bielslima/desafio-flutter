import '../../../data/local-storage/local-storage.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class VerifyPeopleFavorite {
  static Future<bool> execute(String idPeople) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      bool? peopleIsFavorite = await localStorage.find<bool>(
          boxName: InfraConstants.HIVE_BOX_FAVORITES, key: idPeople);

      return peopleIsFavorite ?? false;
    } catch (e) {
      rethrow;
    }
  }
}
