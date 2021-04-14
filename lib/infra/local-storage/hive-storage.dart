import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/local-storage/local-storage.dart';

@Injectable(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  @override
  Future<dynamic> find({
    required String boxName,
    required String key,
  }) async {
    Box box = await Hive.openBox(boxName);

    return box.get(key);
  }

  @override
  Future<List<dynamic>> findAll({
    required String boxName,
  }) async {
    Box box = await Hive.openBox(boxName);

    return box.values.toList();
  }

  @override
  Future<void> write({
    required String boxName,
    required String key,
    required dynamic data,
  }) async {
    Box box = await Hive.openBox(boxName);

    return box.put(key, data);
  }

  @override
  Future<void> writeAll({
    required String boxName,
    required dynamic data,
  }) async {
    Box box = await Hive.openBox(boxName);

    return box.putAll(data);
  }

  @override
  Future<dynamic> delete({
    required String boxName,
    required String key,
  }) async {
    Box box = await Hive.openBox(boxName);

    return box.delete(key);
  }
}
