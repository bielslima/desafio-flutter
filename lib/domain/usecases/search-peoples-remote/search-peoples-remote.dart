import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

import '../../../data/models/query-peoples-model/query-peoples.dart';

class SearchPeoplesRemote {
  static Future<QueryPeoples> execute(String inputExpression,
      {int? page}) async {
    try {
      Response response = await getIt<PeopleRepository>()
          .srcPeoplesRemote(inputExpression, page: page);

      if (response.statusCode == 200)
        return QueryPeoples.fromJson(response.data);

      throw 'Failed to fetch person.';
    } catch (e) {
      throw e;
    }
  }
}
