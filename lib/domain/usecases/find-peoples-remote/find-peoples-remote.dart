import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

import '../../../data/models/query-peoples-model/query-peoples.dart';

class FindPeoplesRemote {
  static Future<QueryPeoples> execute({int? page}) async {
    return getIt<PeopleRepository>().findPeoplesRemote(page: page ?? 1).then(
          (data) => QueryPeoples.fromJson(
            data,
          ),
        );
  }
}
