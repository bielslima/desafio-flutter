import 'dart:async';

import 'package:dio/dio.dart';

import '../../data/local-storage/storage.dart';
import '../../infra/dependency-injection/injectable.dart';
import '../constants.dart';

class HttpInterceptors extends Interceptor {
  final LocalStorage localStorage = getIt<LocalStorage>();

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // print('[${options.method}] => ${options.uri}');

    if (options.path.contains('starwarsfavorites')) {
      int count = await localStorage.find<int>(
              boxName: InfraConstants.HIVE_BOX_MAIN,
              key: InfraConstants.HIVE_KEY_COUNTREQUEST) ??
          0;

      if (count % 2 == 0) options.headers.addAll({'Prefer': 'status=400'});

      localStorage.write<int>(
        boxName: InfraConstants.HIVE_BOX_MAIN,
        key: InfraConstants.HIVE_KEY_COUNTREQUEST,
        data: count + 1,
      );
    }

    handler.next(options);
  }
}
