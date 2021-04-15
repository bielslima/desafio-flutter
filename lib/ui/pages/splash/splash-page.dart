import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../../ui/constants.dart';
import '../../../infra/app/application-store.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/routes/routes.dart';
import '../../../presentation/presenters/splash-page/splash-presenter.dart';
import './components/components.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ApplicationStore appController = getIt<ApplicationStore>();
  final SplashPresenter presenter = getIt<SplashPresenter>();

  @override
  void initState() {
    super.initState();
    presenter
        .init()
        .then(
          (_) => appController.navigateTo(
            context,
            RouterPaths.HOME,
            transitionType: TransitionType.fadeIn,
            clearStack: true,
          ),
        )
        .onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: UiConstants.COLOR_BACKGROUND,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 3,
                ),
                BB8Animation(),
                Spacer(),
                Logo(),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
