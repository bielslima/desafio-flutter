import 'package:popcode_challenge_swapi/data/local-storage/local-storage.dart';
import 'package:popcode_challenge_swapi/data/models/queue-favorite-request/queue-favorite-request.dart';
import 'package:popcode_challenge_swapi/domain/usecases/set-people-favorite-remote/set-people-favorite-remote.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

class SetPeopleFavoriteLocal {
  static Future execute(String idPeople) async {
    ApplicationStore appStore = getIt<ApplicationStore>();
    LocalStorage localStorage = getIt<LocalStorage>();
    try {
      try {
        if (appStore.isConnected)
          await SetPeopleFavoriteRemote.execute(idPeople);
        else
          await localStorage.write(
            boxName: InfraConstants.HIVE_BOX_QUEUEFAVORITES,
            key: idPeople,
            data: QueueFavoriteRequest(idPeople),
          );
      } catch (e) {
        await localStorage.write(
          boxName: InfraConstants.HIVE_BOX_QUEUEFAVORITES,
          key: idPeople,
          data: QueueFavoriteRequest(idPeople),
        );
        rethrow;
      }
      await localStorage.write(
        boxName: InfraConstants.HIVE_BOX_FAVORITES,
        key: idPeople,
        data: true,
      );
    } catch (e) {
      rethrow;
    }
  }
}
