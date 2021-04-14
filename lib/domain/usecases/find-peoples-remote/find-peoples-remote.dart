import 'package:popcode_challenge_swapi/domain/usecases/save-peoples-local-storage/save-peoples-local-storage.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

import '../../../data/models/query-peoples-model/query-peoples.dart';

class FindPeoplesRemote {
  static Future<QueryPeoples> execute({int? page}) async {
    try {
      Map<dynamic, dynamic> responseData =
          await getIt<PeopleRepository>().findPeoplesRemote(page: page ?? 1);

      QueryPeoples qryPeoples = QueryPeoples.fromJson(responseData);

      await SavePeoplesLocalStorage.execute(qryPeoples.results);

      print('Saved ${qryPeoples.results.length} peoples in local database');

      return qryPeoples;
    } catch (e) {
      throw e;
    }
  }
}
