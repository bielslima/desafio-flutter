import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/domain/usecases/verify-people-favorite/verify-people-favorite.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/People/people-repository.dart';

class FindPeoplesLocal {
  static Future<List<People>> execute({int? page}) async {
    try {
      Iterable<People> itPeoples =
          await getIt<PeopleRepository>().findPeoplesLocal(page ?? 1);

      List<People> peoples = itPeoples.toList();

      for (int i = 0; i < peoples.length; i++) {
        People p = peoples[i];

        p.isFavorite = await VerifyPeopleFavorite.execute(p.id);
      }
      return peoples;
    } catch (e) {
      rethrow;
    }
  }
}
