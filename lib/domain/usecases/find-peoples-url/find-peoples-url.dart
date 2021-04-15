import 'package:dio/dio.dart';

import '../../../data/models/people-model/people.dart';
import '../../../data/models/query-peoples-model/query-peoples.dart';
import '../../../domain/usecases/save-peoples-local-storage/save-peoples-local-storage.dart';
import '../../../domain/usecases/verify-people-favorite/verify-people-favorite.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/People/people-repository.dart';

class FindPeoplesUrl {
  static Future<QueryPeoples> execute(String? url) async {
    try {
      Response response =
          await getIt<PeopleRepository>().findFromUrl(url ?? "");

      if (response.statusCode == 200) {
        QueryPeoples qryPeoples = QueryPeoples.fromJson(response.data);

        await SavePeoplesLocalStorage.execute(qryPeoples.results);

        for (int i = 0; i < qryPeoples.results.length; i++) {
          People p = qryPeoples.results[i];

          p.isFavorite = await VerifyPeopleFavorite.execute(p.id);
        }
        return qryPeoples;
      }
      throw 'Failed to fetch peoples, status ${response.statusCode}';
    } catch (e) {
      rethrow;
    }
  }
}
