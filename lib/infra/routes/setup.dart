import 'package:fluro/fluro.dart';

import './routes.dart';

class SetupRoute {
  static void run(FluroRouter router) {
    router.define(
      RouterPaths.SPLASH,
      handler: RoutesHandles.splashHandler,
    );

    router.define(
      RouterPaths.HOME,
      handler: RoutesHandles.homeHandler,
    );

    router.define(
      RouterPaths.DETAILS,
      handler: RoutesHandles.detailsHandle,
    );
  }
}
