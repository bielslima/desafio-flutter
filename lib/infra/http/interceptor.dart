import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:popcode_challenge_swapi/data/local-storage/storage.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

import '../constants.dart';

class HttpInterceptors extends Interceptor {
  final LocalStorage localStorage = getIt<LocalStorage>();

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print(options.method);
    print(options.path);
    print(options.queryParameters);
    if (options.path.contains('starwarsfavorites')) {
      Box box = await Hive.openBox(InfraConstants.HIVE_BOX_MAIN);

      int count = box.get('counterRequest', defaultValue: 0);

      if (count % 2 == 0) options.headers.addAll({'Prefer': 'status=400'});

      box.put(InfraConstants.HIVE_KEY_COUNTREQUEST, count + 1);
    }

    handler.next(options);
  }
}
