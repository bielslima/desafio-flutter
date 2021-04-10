import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/ui/constants.dart';

import '../../../infra/app/application-controller.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/routes/routes.dart';
import './components/components.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ApplicationController appController = getIt<ApplicationController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5))
        .then((_) => appController.navigateTo(context, RouterPaths.HOME));
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
