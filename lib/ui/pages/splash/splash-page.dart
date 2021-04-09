import 'package:flutter/material.dart';

import '../../../infra/app/application-controller.dart';
import '../../../infra/dependency-injection/injectable.dart';
// import '../../../infra/routes/routes.dart';
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
    // Future.delayed(Duration(seconds: 3))
    //     .then((_) => appController.navigateTo(context, RouterPaths.HOME));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                BB8Animation(),
                Spacer(),
                Text(
                  'Splash',
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
