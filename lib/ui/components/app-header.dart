import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/ui/utils/screen-helper.dart';

class AppHeader extends StatelessWidget {
  final bool centerTitle;
  final bool backButton;
  final Widget title;

  AppHeader(
    this.title, {
    this.centerTitle = false,
    this.backButton = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context) * .15,
      color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: this.centerTitle
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          backButton
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })
              : Container(),
          title,
        ],
      ),
    );
  }
}
