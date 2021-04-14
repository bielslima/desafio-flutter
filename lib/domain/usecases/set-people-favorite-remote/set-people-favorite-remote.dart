import 'package:dio/dio.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/repositories/Favorite/favorite-repository.dart';
import 'package:popcode_challenge_swapi/ui/utils/notification-service.dart';

class SetPeopleFavoriteRemote {
  static Future execute(String idPeople) async {
    try {
      FavoriteRepository favoriteRepository = getIt<FavoriteRepository>();

      Response response =
          await favoriteRepository.setFavorite(idPeople: idPeople);

      if (response.statusCode == 201) {
        NotificationService.showToastSuccess(response.data['message']);
        return true;
      } else if (response.statusCode == 400) {
        NotificationService.showToastError(response.data['error_message']);
      } else {
        NotificationService.showToastError(
            'Failed to favor the person: Unknown error.');
      }
      return false;
    } catch (e) {
      throw e;
    }
  }
}
