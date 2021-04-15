import 'package:hive/hive.dart';

import '../../../infra/constants.dart';

part 'queue-favorite-request.g.dart';

@HiveType(typeId: 1)
class QueueFavoriteRequest extends HiveObject {
  @HiveField(0)
  String idPeople;
  QueueFavoriteRequest(this.idPeople);

  String get url =>
      InfraConstants.BASE_URL_STARWARSFAVORITES +
      InfraConstants.ENDPOINT_FAVORITES.replaceAll(':id', idPeople);
}
