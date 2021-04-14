abstract class LocalStorage {
  Future<dynamic> find({
    required String boxName,
    required String key,
  });

  Future<Iterable<T>> findAll<T>({
    required String boxName,
  });

  Future<void> write({
    required String boxName,
    required String key,
    required dynamic data,
  });

  Future<void> writeAll({
    required String boxName,
    required Map<dynamic, dynamic> data,
  });

  Future<void> delete({
    required String boxName,
    required String key,
  });
}
