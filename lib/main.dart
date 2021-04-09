// import 'package:fluro/fluro.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/infra/app/application-controller.dart';
import 'package:popcode_challenge_swapi/ui/components/theme-app.dart';

import './infra/routes/routes.dart';
import './infra/dependency-injection/injectable.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}

class App extends StatelessWidget {
  final ApplicationController appController = di.getIt<ApplicationController>();

  App() {
    final router = FluroRouter();
    SetupRoute.run(router);
    appController.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stars Wiki',
      theme: buildThemeApp(),
      onGenerateRoute: appController.router?.generator,
      initialRoute: RouterPaths.HOME,
    );
  }
}
