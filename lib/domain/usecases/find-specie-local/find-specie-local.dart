import '../../../data/local-storage/storage.dart';
import '../../../data/models/models.dart';
import '../../../infra/constants.dart';
import '../../../infra/dependency-injection/injectable.dart';

class FindSpecieLocal {
  static Future<Specie?> execute(String id) async {
    if (id == '') return null;
    try {
      LocalStorage localStorage = getIt<LocalStorage>();

      Specie specie = await localStorage.find<Specie>(
        boxName: InfraConstants.HIVE_BOX_SPECIE,
        key: id,
      );

      return specie;
    } catch (e) {
      throw e;
    }
  }
}
