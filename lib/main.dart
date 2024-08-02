import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:temskishore/Routing/routes.dart';
import 'package:temskishore/view/Authentication/authentication.dart';

import 'view/Homepage/homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.lightBlue));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: authenticationPageRoute,
      getPages: [
        GetPage(name: homePageRoute, page: () => const HomePage()),
        GetPage(name: authenticationPageRoute, page: () => const LoginPage())
      ],
    );
  }
}
