import 'package:flutter/material.dart';

import '../view/Authentication/authentication.dart';
import '../view/Homepage/homepage.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePageRoute:
      return getPageRoute(const HomePage());
    case authenticationPageRoute:
      return getPageRoute(const LoginPage());
    default:
      return getPageRoute(const LoginPage());
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
