import 'package:flutter/material.dart';
import 'package:temskishore/Constants/controllers.dart';
import 'package:temskishore/Routing/router.dart';
import 'package:temskishore/Routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: authenticationPageRoute,
      onGenerateRoute: generateRoute,
    );
