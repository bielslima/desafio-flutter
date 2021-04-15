import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/data/models/query-peoples-model/query-peoples.dart';
import 'package:popcode_challenge_swapi/domain/usecases/save-peoples-local-storage/save-peoples-local-storage.dart';
import 'package:popcode_challenge_swapi/domain/usecases/verify-people-favorite/verify-people-favorite.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

class FindPeoplesUrl {
  static Future<QueryPeoples> execute(String? url) async {
    try {
      Response response = await getIt<PeopleRepository>()
          .findAllPeoplesWithUrlRemote(url ?? "");

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
