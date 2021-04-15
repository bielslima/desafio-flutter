import '../../../data/models/people-model/people.dart';
import '../../../domain/usecases/verify-people-favorite/verify-people-favorite.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/People/people-repository.dart';

class FindPeoplesLocal {
  static Future<List<People>> execute({int? page}) async {
    try {
      Iterable itPeoples =
          getIt<PeopleRepository>().findPeoplesLocal(page ?? 1);

      List peoples = itPeoples.toList();

      for (int i = 0; i < peoples.length; i++) {
        People p = peoples[i];

        p.isFavorite = await VerifyPeopleFavorite.execute(p.id);
      }

      peoples as List<People>;

      peoples.sort((p1, p2) => int.parse(p1.id).compareTo(int.parse(p2.id)));

      return peoples;
    } catch (e) {
      rethrow;
    }
  }
}
