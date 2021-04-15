import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class SearchPeoplesLocal {
  static Future<List<People>> execute(String inputExpression,
      {int? page}) async {
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      List<People> lst = (await localStorage.findAll<People>(
              boxName: InfraConstants.HIVE_BOX_PEOPLE))
          .where((el) => el.name.contains(RegExp('^.*?$inputExpression.*?')))
          .toList();

      return lst;
    } catch (e) {
      throw e;
    }
  }
}
