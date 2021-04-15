import '../../../data/local-storage/storage.dart';
import '../../../data/models/people-model/people.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class FindPeopleLocal {
  static Future<People> execute(String id) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      People people = await localStorage.find<People>(
        boxName: InfraConstants.HIVE_BOX_PEOPLE,
        key: id,
      );

      return people;
    } catch (e) {
      throw e;
    }
  }
}
