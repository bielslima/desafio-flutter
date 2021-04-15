import '../../../data/local-storage/storage.dart';
import '../../../data/models/planet-model/planet.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class SavePlanetsLocalStorage {
  static Future execute(List<Planet> planets) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      for (int i = 0; i < planets.length; i++) {
        Planet planetRemote = planets[i];

        Planet? peopleLocal = await localStorage.find<Planet>(
            boxName: InfraConstants.HIVE_BOX_PLANET, key: planetRemote.id);

        if (peopleLocal != null) {
          DateTime currentLocalDateEdited = DateTime.parse(peopleLocal.edited);
          DateTime currentRemoteDateEdited =
              DateTime.parse(planetRemote.edited);

          if (currentRemoteDateEdited.microsecondsSinceEpoch >
              currentLocalDateEdited.microsecondsSinceEpoch) {
            await localStorage.write<Planet>(
              boxName: InfraConstants.HIVE_BOX_PLANET,
              key: planetRemote.id,
              data: planetRemote,
            );
          }
        } else {
          await localStorage.write<Planet>(
            boxName: InfraConstants.HIVE_BOX_PLANET,
            key: planetRemote.id,
            data: planetRemote,
          );
        }
      }
    } catch (e) {
      throw e;
    }
  }
}
