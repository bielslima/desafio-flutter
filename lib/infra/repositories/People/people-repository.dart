import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/http/http-client.dart';
import 'package:popcode_challenge_swapi/data/local-storage/local-storage.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

import '../../constants.dart';

abstract class IPeopleRepository {
  Future findPeopleRemote(String idPeople);
  Future findPeoplesRemote({String? path, int? page});
}

@injectable
class PeopleRepository implements IPeopleRepository {
  Future<dynamic> findPeoplesLocal(int page) async {
    return getIt<LocalStorage>().findAll(boxName: InfraConstants.BOX_PEOPLE);
  }

  Future<dynamic> findPeoplesRemote({String? path, int? page}) async {
    return getIt<HttpClient>().httpGet(
      path ?? InfraConstants.ENDPOINT_PEOPLES,
      queryParameters: {
        'page': page.toString(),
      },
    );
  }

  Future<dynamic> srcPeoplesRemote(
    String inputExpression, {
    String? path,
    int? page,
  }) async {
    return getIt<HttpClient>().httpGet(
      path ?? InfraConstants.ENDPOINT_PEOPLES,
      queryParameters: {
        'search': inputExpression,
        // 'page': page ?? 1,
      },
    );
  }

  Future<dynamic> findPeopleRemote(String path) async {
    return getIt<HttpClient>().httpGet(path);
  }
}
