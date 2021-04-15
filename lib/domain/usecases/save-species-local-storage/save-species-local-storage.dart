import '../../../data/local-storage/storage.dart';
import '../../../data/models/species-model/specie.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class SaveSpeciesLocalStorage {
  static Future execute(List<Specie> species) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      for (int i = 0; i < species.length; i++) {
        Specie specieRemote = species[i];

        Specie? peopleLocal = await localStorage.find<Specie>(
            boxName: InfraConstants.HIVE_BOX_SPECIE, key: specieRemote.id);

        if (peopleLocal != null) {
          DateTime currentLocalDateEdited = DateTime.parse(peopleLocal.edited);
          DateTime currentRemoteDateEdited =
              DateTime.parse(specieRemote.edited);

          if (currentRemoteDateEdited.microsecondsSinceEpoch >
              currentLocalDateEdited.microsecondsSinceEpoch) {
            await localStorage.write<Specie>(
              boxName: InfraConstants.HIVE_BOX_SPECIE,
              key: specieRemote.id,
              data: specieRemote,
            );
          }
        } else {
          await localStorage.write<Specie>(
            boxName: InfraConstants.HIVE_BOX_SPECIE,
            key: specieRemote.id,
            data: specieRemote,
          );
        }
      }
    } catch (e) {
      throw e;
    }
  }
}
