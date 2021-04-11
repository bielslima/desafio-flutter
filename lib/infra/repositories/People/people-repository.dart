import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/http/http-client.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

import '../../constants.dart';

abstract class IPeopleRepository {
  Future findPeoples();
}

@injectable
class PeopleRepository implements IPeopleRepository {
  Future<Response> findPeoples({String? path}) async {
    return getIt<HttpClient>().httpGet(path ?? InfraConstants.ENDPOINT_PEOPLES);
  }

  Future<Response> findPeople(String idPeople) async {
    return getIt<HttpClient>()
        .httpGet("${InfraConstants.ENDPOINT_PEOPLES}/$idPeople");
  }
}
