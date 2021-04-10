import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../ui/pages/pages.dart';

class RoutesHandles {
  static Handler splashHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        SplashPage(),
  );

  static Handler homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        HomePage(),
  );

  static Handler detailsHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        DetailsPage(),
  );

  static Handler searchHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        SearchPage(),
  );
}
