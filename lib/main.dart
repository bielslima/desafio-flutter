// import 'package:fluro/fluro.dart';
import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart';

import './data/models/models.dart';
import './infra/app/application-store.dart';
import './infra/constants.dart';
import './ui/components/theme-app.dart';
import './infra/routes/routes.dart';
import './infra/dependency-injection/injectable.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveDatabase();
  await di.init();
  runApp(App());
}

Future<void> initHiveDatabase() async {
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  registerHiveAdapters();

  await Hive.openBox<bool>(InfraConstants.HIVE_BOX_FAVORITES);
  await Hive.openBox<int>(InfraConstants.HIVE_BOX_MAIN);
  await Hive.openBox<People>(InfraConstants.HIVE_BOX_PEOPLE);
  await Hive.openBox<Planet>(InfraConstants.HIVE_BOX_PLANET);
  await Hive.openBox<QueueFavoriteRequest>(
      InfraConstants.HIVE_BOX_QUEUEFAVORITES);
  await Hive.openBox<Specie>(InfraConstants.HIVE_BOX_SPECIE);
}

void registerHiveAdapters() {
  Hive.registerAdapter(PeopleAdapter());
  Hive.registerAdapter(QueueFavoriteRequestAdapter());
  Hive.registerAdapter(SpecieAdapter());
  Hive.registerAdapter(PlanetAdapter());
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
