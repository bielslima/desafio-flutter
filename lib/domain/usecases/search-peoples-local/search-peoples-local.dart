import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class SearchPeoplesLocal {
  static List<People> execute(String inputExpression, {int? page}) {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      Iterable lstPeople =
          localStorage.findAll<People>(boxName: InfraConstants.HIVE_BOX_PEOPLE);

      List lst = lstPeople
          .where((el) => el.name.contains(RegExp('^.*?$inputExpression.*?')))
          .toList();

      lst as List<People>;
      return lst;
    } catch (e) {
      throw e;
    }
  }
}
