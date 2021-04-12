import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'application-store.g.dart';

@singleton
class ApplicationStore = _ApplicationStoreBase with _$ApplicationStore;

abstract class _ApplicationStoreBase with Store {
  late FluroRouter router;

  Future<dynamic> navigateTo(
    BuildContext context,
    String path, {
    bool clearStack = false,
    Object? arguments,
    TransitionType transitionType = TransitionType.native,
  }) {
    return this.router.navigateTo(
          context,
          path,
          clearStack: clearStack,
          transition: transitionType,
          routeSettings: RouteSettings(
            arguments: arguments,
          ),
        );
  }
}
