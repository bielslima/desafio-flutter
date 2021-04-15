import 'package:dio/dio.dart';

import '../../../data/local-storage/local-storage.dart';
import '../../../data/models/queue-favorite-request/queue-favorite-request.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/repositories/Favorite/favorite-repository.dart';

class SendQueueFavorites {
  static Future execute() async {
    try {
      final LocalStorage localStorage = getIt<LocalStorage>();
      final FavoriteRepository favoriteRepository = getIt<FavoriteRepository>();

      Iterable queue = localStorage.findAll<QueueFavoriteRequest>(
        boxName: InfraConstants.HIVE_BOX_QUEUEFAVORITES,
      );

      for (QueueFavoriteRequest favRequest in queue) {
        Response response = await favoriteRepository.setFavorite(
          idPeople: favRequest.idPeople,
          url: favRequest.url,
        );

        if (response.statusCode == 201) {
          await favRequest.delete();
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
