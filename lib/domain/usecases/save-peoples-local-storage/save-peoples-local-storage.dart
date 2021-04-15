import '../../../data/local-storage/storage.dart';
import '../../../data/models/people-model/people.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class SavePeoplesLocalStorage {
  static Future execute(List<People> peoples) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      for (int i = 0; i < peoples.length; i++) {
        People peopleRemote = peoples[i];

        People? peopleLocal = await localStorage.find<People>(
            boxName: InfraConstants.HIVE_BOX_PEOPLE, key: peopleRemote.id);

        if (peopleLocal != null) {
          DateTime currentLocalDateEdited = DateTime.parse(peopleLocal.edited);
          DateTime currentRemoteDateEdited =
              DateTime.parse(peopleRemote.edited);

          if (currentRemoteDateEdited.microsecondsSinceEpoch >
              currentLocalDateEdited.microsecondsSinceEpoch) {
            await localStorage.write<People>(
              boxName: InfraConstants.HIVE_BOX_PEOPLE,
              key: peopleRemote.id,
              data: peopleRemote,
            );
          }
        } else {
          await localStorage.write<People>(
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
