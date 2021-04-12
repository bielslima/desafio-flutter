// import 'package:fluro/fluro.dart';
import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/ui/components/theme-app.dart';

import './infra/routes/routes.dart';
import './infra/dependency-injection/injectable.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}

void initHiveDatabase() {
  var path = Directory.current.path;
  Hive.init(path);
}

class App extends StatelessWidget {
  final ApplicationStore appController = di.getIt<ApplicationStore>();

  App() {
    final router = FluroRouter();
    SetupRoute.run(router);
    appController.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Stars Wiki',
        debugShowCheckedModeBanner: false,
        theme: buildThemeApp(),
        onGenerateRoute: appController.router.generator,
        initialRoute: RouterPaths.SPLASH,
      ),
    );
  }
}
