import 'package:flutter/material.dart';

class ScreenHelper {
  static double screenHeight(BuildContext c) => MediaQuery.of(c).size.height;
  static double screenWidth(BuildContext c) => MediaQuery.of(c).size.width;
}
