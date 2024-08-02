import 'package:flutter/material.dart';
import 'package:temskishore/Routing/routes.dart';
import 'package:temskishore/view/Authentication/authentication.dart';
import 'package:temskishore/view/Homepage/homepage.dart';

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
