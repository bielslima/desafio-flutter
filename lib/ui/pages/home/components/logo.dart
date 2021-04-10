import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/ui/constants.dart';
import 'package:popcode_challenge_swapi/ui/utils/screen-helper.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context) * .1,
      child: Image.asset(
        UiConstants.LOGO_APP_DARK,
      ),
    );
  }
}
