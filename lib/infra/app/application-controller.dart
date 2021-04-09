import 'package:fluro/fluro.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'application-controller.g.dart';

@singleton
class ApplicationController = _ApplicationControllerBase
    with _$ApplicationController;

abstract class _ApplicationControllerBase with Store {
  FluroRouter? router;
}
