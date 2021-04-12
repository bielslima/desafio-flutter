import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

import '../../../data/models/query-peoples/query-peoples.dart';

class SearchPeoplesRemote {
  static Future<QueryPeoples> execute(String inputExpression,
      {int? page}) async {
    return getIt<PeopleRepository>()
        .srcPeoplesRemote(inputExpression, page: page)
        .then(
          (data) => QueryPeoples.fromJson(
            data,
          ),
        );
  }
}
