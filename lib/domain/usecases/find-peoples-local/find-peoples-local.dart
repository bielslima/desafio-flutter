import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

class FindPeoplesLocal {
  static Future<List<People>> execute({int? page}) async {
    return getIt<PeopleRepository>().findPeoplesLocal(page ?? 1).then((value) {
      // print(value.runtimeType);
      // print(value.length);
      // print(value[0]);
      return value.toList();
    });
  }
}
