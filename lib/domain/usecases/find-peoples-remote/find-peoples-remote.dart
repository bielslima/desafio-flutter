import 'package:dio/dio.dart';

import '../../../data/models/people-model/people.dart';
import '../../../domain/usecases/save-peoples-local-storage/save-peoples-local-storage.dart';
import '../../../domain/usecases/verify-people-favorite/verify-people-favorite.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/People/people-repository.dart';
import '../../../data/models/query-peoples-model/query-peoples.dart';

class FindPeoplesRemote {
  static Future<QueryPeoples> execute({int? page}) async {
    try {
      Response response =
          await getIt<PeopleRepository>().findPeoplesRemote(page: page ?? 1);

      QueryPeoples qryPeoples;

      if (response.statusCode == 200) {
        qryPeoples = QueryPeoples.fromJson(response.data);

        await SavePeoplesLocalStorage.execute(qryPeoples.results);

        for (int i = 0; i < qryPeoples.results.length; i++) {
          People p = qryPeoples.results[i];

          p.isFavorite = await VerifyPeopleFavorite.execute(p.id);
        }

        return qryPeoples;
      }
      throw 'Failed to fetch data. Error code: ${response.statusCode}';
    } catch (e) {
      throw e;
    }
  }
}
