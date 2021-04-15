import '../../../data/local-storage/storage.dart';
import '../../../data/models/models.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class FindPlanetLocal {
  static Future<Planet> execute(String id) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      Planet planet = await localStorage.find<Planet>(
        boxName: InfraConstants.HIVE_BOX_PLANET,
        key: id,
      );

      return planet;
    } catch (e) {
      throw e;
    }
  }
}
