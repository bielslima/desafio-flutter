import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/local-storage/local-storage.dart';

@Injectable(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  @override
  Future find<T>({
    required String boxName,
    required String key,
  }) async {
    Box<T> box = Hive.box<T>(boxName);

    return box.get(key);
  }

  @override
  Iterable findAll<T>({
    required String boxName,
  }) {
    Box box = Hive.box<T>(boxName);

    // final Iterable retorno = ;

    // await box.close();

    return box.values;
  }

  @override
  Future<void> write<T>({
    required String boxName,
    required String key,
    required dynamic data,
  }) async {
    Box box = Hive.box<T>(boxName);

    // if (Hive.isBoxOpen(boxName)) await Hive.openBox(boxName);

    // box = Hive.box(boxName);

    // await box.put(key, data);

    // await box.close();

    return box.put(key, data);
  }

  @override
  Future<void> writeAll<T>({
    required String boxName,
    required dynamic data,
  }) async {
    Box box = Hive.box<T>(boxName);

    // if (Hive.isBoxOpen(boxName)) await Hive.openBox(boxName);

    // box = Hive.box(boxName);

    // await box.putAll(data);

    // await box.close();

    return box.putAll(data);
  }

  @override
  Future delete<T>({
    required String boxName,
    required String key,
  }) async {
    Box<T> box = Hive.box<T>(boxName);

    // if (Hive.isBoxOpen(boxName)) await Hive.openBox(boxName);

    // box = Hive.box(boxName);

    // await box.delete(key);

    // box.close();

    return box.delete(key);
  }
}
