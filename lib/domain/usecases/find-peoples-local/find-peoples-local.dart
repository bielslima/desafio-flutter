import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

import '../../../data/models/query-peoples/query-peoples.dart';

class FindPeoplesLocal {
  static Future<QueryPeoples> execute({int? page}) async {
    return getIt<PeopleRepository>().findPeoplesLocal(page ?? 1).then(
          (data) => QueryPeoples.fromJson(data),
        );
  }
}
