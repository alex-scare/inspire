import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NavigationRouteStyle {
  cupertino,
  material,
}

class Navigation {
  static Future<T?> navigateTo<T>({
    required BuildContext context,
    required Widget screen,
    required NavigationRouteStyle style,
  }) async {
    Route<T> route = style == NavigationRouteStyle.cupertino
        ? CupertinoPageRoute<T>(builder: (_) => screen)
        : MaterialPageRoute<T>(builder: (_) => screen);

    return await Navigator.push<T>(context, route);
  }
}
