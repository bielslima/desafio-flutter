import 'package:flutter/rendering.dart';
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
