import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/routes/routes.dart';
import 'package:popcode_challenge_swapi/ui/components/app-header.dart';

import '../../constants.dart';
import 'components/components.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApplicationStore appControl = getIt<ApplicationStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UiConstants.COLOR_BACKGROUND,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppHeader(
              Logo(),
              action: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => appControl.navigateTo(
                  context,
                  RouterPaths.SEARCH,
                  transitionType: TransitionType.fadeIn,
                ),
              ),
            ),
            Expanded(
              child: ListInfiniteScroll(),
            ),
          ],
        ),
      ),
    );
  }
}
