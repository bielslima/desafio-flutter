import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/infra/app/application-controller.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/routes/routes.dart';
import 'package:popcode_challenge_swapi/ui/components/app-header.dart';

import 'components/components.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApplicationController appControl = getIt<ApplicationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppHeader(
            Logo(),
          ),
          Text("HomePage"),
          ElevatedButton(
            onPressed: () {
              appControl.navigateTo(context, RouterPaths.DETAILS,
                  transitionType: TransitionType.fadeIn);
            },
            child: Text('Go to details'),
          )
        ],
      ),
    );
  }
}
