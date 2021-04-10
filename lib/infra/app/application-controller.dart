import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'application-controller.g.dart';

@singleton
class ApplicationController = _ApplicationControllerBase
    with _$ApplicationController;

abstract class _ApplicationControllerBase with Store {
  late FluroRouter router;

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
