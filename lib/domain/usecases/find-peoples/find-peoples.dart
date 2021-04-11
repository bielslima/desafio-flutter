import 'package:popcode_challenge_swapi/data/http/http-client.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

import '../../../data/models/query-peoples/query-peoples.dart';

class FindPeoples {
  static Future<QueryPeoples> execute() async {
    return getIt<PeopleRepository>()
        .findPeoples()
        .then((resp) => QueryPeoples.fromJson(resp.data));
  }
}
