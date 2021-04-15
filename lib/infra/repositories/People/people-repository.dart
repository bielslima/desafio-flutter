import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../data/http/http-client.dart';
import '../../../data/local-storage/local-storage.dart';
import '../../../data/models/people-model/people.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../constants.dart';

abstract class IPeopleRepository {
  Future findPeopleRemote(String idPeople);
  Future findPeoplesRemote({String? path, int page});
}

@injectable
class PeopleRepository implements IPeopleRepository {
  Iterable findPeoplesLocal(int page) {
    return getIt<LocalStorage>()
        .findAll<People>(boxName: InfraConstants.HIVE_BOX_PEOPLE);
  }

  Future<Response> findFromUrl(String url) async {
    return getIt<HttpClient>().httpGet(
      url,
    );
  }

  Future<Response> findPeoplesRemote({String? path, int page = 1}) async {
    return await getIt<HttpClient>().httpGet(
      path ?? InfraConstants.BASE_URL_SWAPI + InfraConstants.ENDPOINT_PEOPLES,
      queryParameters: {
        'page': page.toString(),
      },
    );
  }

  Future<dynamic> srcPeoplesRemote(
    String inputExpression, {
    String? path,
    int page = 1,
  }) async {
    return getIt<HttpClient>().httpGet(
      path ?? InfraConstants.BASE_URL_SWAPI + InfraConstants.ENDPOINT_PEOPLES,
      queryParameters: {
        'search': inputExpression,
        'page': page.toString(),
      },
    );
  }

  Future<dynamic> findPeopleRemote(String path) async {
    return getIt<HttpClient>().httpGet(path);
  }
}
