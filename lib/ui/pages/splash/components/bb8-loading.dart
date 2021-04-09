import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../ui/utils/screen-helper.dart';
import '../../../constants.dart';

class BB8Animation extends StatefulWidget {
  @override
  _BB8AnimationState createState() => _BB8AnimationState();
}

class _BB8AnimationState extends State<BB8Animation>
    with TickerProviderStateMixin {
  // late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // this._animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        UiConstants.ANIMATION_LOADING_SPLASH,
        height: ScreenHelper.screenHeight(context) * .3,
        frameRate: FrameRate(60),
        repeat: true,
      ),
    );
  }
}
