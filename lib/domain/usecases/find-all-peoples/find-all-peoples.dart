import 'package:dio/dio.dart';

import '../../../data/models/people-model/people.dart';
import '../../../data/models/query-peoples-model/query-peoples.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/People/people-repository.dart';

class FindAllPeoplesLocal {
  static Future execute() async {
    PeopleRepository repository = getIt<PeopleRepository>();
    try {
      QueryPeoples qryPeoples = QueryPeoples(
          0,
          InfraConstants.BASE_URL_SWAPI + InfraConstants.ENDPOINT_PEOPLES,
          '', []);
      List<People> peoples = [];

      while (qryPeoples.next != '') {
        Response response = await repository.findFromUrl(qryPeoples.next);

        if (response.statusCode == 200) {
          qryPeoples = QueryPeoples.fromJson(response.data);
          peoples.addAll(qryPeoples.results);
        }
      }
    } catch (e) {
      throw e;
    }
  }
}
