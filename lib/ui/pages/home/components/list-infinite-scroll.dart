import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/routes/routes.dart';

import 'components.dart';

class ListInfiniteScroll extends StatelessWidget {
  final ApplicationStore appControl = getIt<ApplicationStore>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) => InkWell(
        child: PeopleWidget(),
        onTap: () {
          appControl.navigateTo(
            context,
            RouterPaths.DETAILS,
            transitionType: TransitionType.fadeIn,
          );
        },
      ),
      itemCount: 15,
      separatorBuilder: (_, i) => SizedBox(
        height: 10,
      ),
      padding: EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 10,
      ),
    );
  }
}
