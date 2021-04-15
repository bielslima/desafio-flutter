import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/local-storage/local-storage.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';

@Injectable(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  @override
  Future<T> find<T>({
    required String boxName,
    required String key,
  }) async {
    Box box = await Hive.openBox<T>(boxName);

    final T retorno = await box.get(key);

    await box.close();

    return retorno;
  }

  @override
  Future<Iterable<T>> findAll<T>({
    required String boxName,
  }) async {
    Box<T> box = await Hive.openBox<T>(boxName);

    final Iterable<T> retorno = box.values;

    await box.close();

    return retorno;
  }

  @override
  Future<void> write({
    required String boxName,
    required String key,
    required dynamic data,
  }) async {
    print('Writing $boxName => $key');
    Box box = await Hive.openBox(boxName);

    await box.put(key, data);

    await box.close();

    return;
  }

  @override
  Future<void> writeAll({
    required String boxName,
    required dynamic data,
  }) async {
    Box box = await Hive.openBox(boxName);

    await box.putAll(data);

    await box.close();

    return;
  }

  @override
  Future<dynamic> delete({
    required String boxName,
    required String key,
  }) async {
    Box box = await Hive.openBox(boxName);

    await box.delete(key);

    box.close();

    return;
  }
}
