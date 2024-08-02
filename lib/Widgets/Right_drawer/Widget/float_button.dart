import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Utils/string.dart';

class FloatButton extends StatefulWidget {
  const FloatButton({super.key});

  @override
  State<FloatButton> createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  // final BoolDrawerController _drawerSelect = Get.put(BoolDrawerController());
  final MainDrawerString _drawer = Get.put(MainDrawerString());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: 20,
        right: 0, // Adjust 50.0 as needed
        child: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () {
                setState(() {
                  _drawer.drawerValue = 'main';
                });
                Scaffold.of(context).openEndDrawer();
              },
              backgroundColor: Colors.transparent,
              child: Container(
                  height: 50,
                  width: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Lottie.asset('assets/svg/gear.json',
                          width: 8, height: 8),
                    ),
                  )),
            );
          },
        ),
      ),
    ]);
  }
}
