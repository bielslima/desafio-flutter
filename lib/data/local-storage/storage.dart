abstract class LocalStorage {
  Future find<T>({
    required String boxName,
    required String key,
  });

  Iterable findAll<T>({
    required String boxName,
  });

  Future<void> write<T>({
    required String boxName,
    required String key,
    required dynamic data,
  });

  Future<void> writeAll<T>({
    required String boxName,
    required Map<dynamic, dynamic> data,
  });

  Future delete<T>({
    required String boxName,
    required String key,
  });
}
