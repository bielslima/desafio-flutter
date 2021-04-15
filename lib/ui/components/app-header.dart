import 'package:flutter/material.dart';

import '../../ui/utils/screen-helper.dart';

class AppHeader extends StatelessWidget {
  final bool centerTitle;
  final bool backButton;
  final Widget? title;
  final Widget? searchIcon;
  final Widget? action;

  AppHeader({
    this.title,
    this.centerTitle = false,
    this.backButton = false,
    this.searchIcon,
    this.action,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context) * .15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          backButton
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })
              : Container(),
          title ?? Container(),
          Spacer(),
          this.action ?? Container(),
          this.searchIcon ?? Container(),
        ],
      ),
    );
  }
}
