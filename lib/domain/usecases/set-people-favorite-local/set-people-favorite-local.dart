import '../../../data/local-storage/local-storage.dart';
import '../../../data/models/queue-favorite-request/queue-favorite-request.dart';
import '../../../domain/usecases/set-people-favorite-remote/set-people-favorite-remote.dart';
import '../../../infra/app/application-store.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class SetPeopleFavoriteLocal {
  static Future execute(String idPeople) async {
    ApplicationStore appStore = getIt<ApplicationStore>();
    LocalStorage localStorage = getIt<LocalStorage>();

    bool setAsFavorite = false;

    try {
      if (appStore.isConnected)
        setAsFavorite = await SetPeopleFavoriteRemote.execute(idPeople);
      else
        await localStorage.write<QueueFavoriteRequest>(
          boxName: InfraConstants.HIVE_BOX_QUEUEFAVORITES,
          key: idPeople,
          data: QueueFavoriteRequest(idPeople),
        );
      if (!setAsFavorite)
        await localStorage.write<QueueFavoriteRequest>(
          boxName: InfraConstants.HIVE_BOX_QUEUEFAVORITES,
          key: idPeople,
          data: QueueFavoriteRequest(idPeople),
        );
    } catch (e) {
      throw e;
    } finally {
      await localStorage.write<bool>(
        boxName: InfraConstants.HIVE_BOX_FAVORITES,
        key: idPeople,
        data: true,
      );
    }
  }
}
