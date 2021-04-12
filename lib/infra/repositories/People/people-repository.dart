import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/http/http-client.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

import '../../constants.dart';

abstract class IPeopleRepository {
  Future findPeoples(int page);
  Future findPeople(String idPeople);
}

@injectable
class PeopleRepository implements IPeopleRepository {
  Future<dynamic> findPeoples(int page, {String? path}) async {
    return getIt<HttpClient>().httpGet(
      path ?? InfraConstants.ENDPOINT_PEOPLES,
      queryParameters: {
        'page': page.toString(),
      },
    );
  }

  Future<dynamic> findPeople(String path) async {
    return getIt<HttpClient>().httpGet(path);
  }
}
