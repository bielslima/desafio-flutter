import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class SavePeoplesLocalStorage {
  static Future execute(List<People> peoples) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      for (int i = 0; i < peoples.length; i++) {
        People peopleRemote = peoples[i];

        People? peopleLocal = await localStorage.find(
            boxName: InfraConstants.HIVE_BOX_PEOPLE, key: peopleRemote.id);

        if (peopleLocal != null) {
          DateTime currentLocalDateEdited = DateTime.parse(peopleLocal.edited);
          DateTime currentRemoteDateEdited =
              DateTime.parse(peopleRemote.edited);

          if (currentRemoteDateEdited.microsecondsSinceEpoch >
              currentLocalDateEdited.microsecondsSinceEpoch) {
            await localStorage.write(
              boxName: InfraConstants.HIVE_BOX_PEOPLE,
              key: peopleRemote.id,
              data: peopleRemote,
            );
          }
        } else {
          await localStorage.write(
            boxName: InfraConstants.HIVE_BOX_PEOPLE,
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
