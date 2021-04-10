import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/ui/constants.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Image.asset(UiConstants.LOGO_APP_DARK),
    );
  }
}
