import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

class FindPeople {
  static Future<People> execute(String idPeople) async {
    return getIt<PeopleRepository>()
        .findPeople(idPeople)
        .then((resp) => People.fromJson(resp.data));
  }
}
