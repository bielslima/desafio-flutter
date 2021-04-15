import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../data/http/http-client.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../constants.dart';

abstract class IFavoriteRepository {
  Future<Response> setFavorite({String? url, required String idPeople});
}

@injectable
class FavoriteRepository implements IFavoriteRepository {
  Future<Response> setFavorite({String? url, required String idPeople}) async {
    return getIt<HttpClient>().httpPost(
      url ??
          InfraConstants.BASE_URL_STARWARSFAVORITES +
              InfraConstants.ENDPOINT_FAVORITES.replaceAll(':id', idPeople),
    );
  }
}
