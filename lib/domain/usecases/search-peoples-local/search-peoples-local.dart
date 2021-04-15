import '../../../data/local-storage/storage.dart';
import '../../../data/models/people-model/people.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class SearchPeoplesLocal {
  static List<People> execute(String inputExpression, {int? page}) {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      Iterable lstPeople =
          localStorage.findAll<People>(boxName: InfraConstants.HIVE_BOX_PEOPLE);

      List lst = lstPeople
          // .where((el) => el.name.contains(RegExp('^.*?$inputExpression.*?')))
          .where((el) => el.name.contains(inputExpression))
          .toList();

      lst as List<People>;
      return lst;
    } catch (e) {
      throw e;
    }
  }
}
