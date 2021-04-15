import '../../../data/models/people-model/people.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/People/people-repository.dart';

class FindPeopleRemote {
  static Future<People> execute(String idPeople) async {
    return getIt<PeopleRepository>()
        .findPeopleRemote(idPeople)
        .then((data) => People.fromJson(data));
  }
}
