import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/data/models/planet-model/planet.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class SavePlanetsLocalStorage {
  static Future execute(List<Planet> planets) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      for (int i = 0; i < planets.length; i++) {
        Planet peopleRemote = planets[i];

        Planet? peopleLocal = await localStorage.find<Planet>(
            boxName: InfraConstants.HIVE_BOX_PLANET, key: peopleRemote.id);

        if (peopleLocal != null) {
          DateTime currentLocalDateEdited = DateTime.parse(peopleLocal.edited);
          DateTime currentRemoteDateEdited =
              DateTime.parse(peopleRemote.edited);

          if (currentRemoteDateEdited.microsecondsSinceEpoch >
              currentLocalDateEdited.microsecondsSinceEpoch) {
            await localStorage.write<Planet>(
              boxName: InfraConstants.HIVE_BOX_PLANET,
              key: peopleRemote.id,
              data: peopleRemote,
            );
          }
        } else {
          await localStorage.write<Planet>(
            boxName: InfraConstants.HIVE_BOX_PLANET,
            key: peopleRemote.id,
            data: peopleRemote,
          );
        }
      }
      print("writed ${planets.length} plantes in local storage.");
    } catch (e) {
      throw e;
    }
  }
}
