import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'application-store.g.dart';

@singleton
class ApplicationStore = _ApplicationStoreBase with _$ApplicationStore;

abstract class _ApplicationStoreBase with Store {
  late FluroRouter router;
  final Connectivity _connectivity = Connectivity();

  Future<dynamic> navigateTo(
    BuildContext context,
    String path, {
    bool clearStack = false,
    TransitionType transitionType = TransitionType.native,
  }) {
    return this.router.navigateTo(context, path,
        clearStack: clearStack, transition: transitionType);
  }
}
