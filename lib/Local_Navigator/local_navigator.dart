import 'package:flutter/material.dart';

import '../Constants/controllers.dart';
import '../Routing/router.dart';
import '../Routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: authenticationPageRoute,
      onGenerateRoute: generateRoute,
    );
