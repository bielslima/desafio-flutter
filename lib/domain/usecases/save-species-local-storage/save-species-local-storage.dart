import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/data/models/species-model/specie.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class SaveSpeciesLocalStorage {
  static Future execute(List<Specie> species) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      for (int i = 0; i < species.length; i++) {
        Specie peopleRemote = species[i];

        Specie? peopleLocal = await localStorage.find<Specie>(
            boxName: InfraConstants.HIVE_BOX_SPECIE, key: peopleRemote.id);

        if (peopleLocal != null) {
          DateTime currentLocalDateEdited = DateTime.parse(peopleLocal.edited);
          DateTime currentRemoteDateEdited =
              DateTime.parse(peopleRemote.edited);

          if (currentRemoteDateEdited.microsecondsSinceEpoch >
              currentLocalDateEdited.microsecondsSinceEpoch) {
            await localStorage.write<Specie>(
              boxName: InfraConstants.HIVE_BOX_SPECIE,
              key: peopleRemote.id,
              data: peopleRemote,
            );
          }
        } else {
          await localStorage.write<Specie>(
            boxName: InfraConstants.HIVE_BOX_SPECIE,
            key: peopleRemote.id,
            data: peopleRemote,
          );
        }
      }
    } catch (e) {
      throw e;
    }
  }
}
