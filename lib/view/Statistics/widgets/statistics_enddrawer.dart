import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/map_style/map_controller.dart';

class DrawerRight1 extends StatelessWidget {
  const DrawerRight1({super.key});

  @override
  Widget build(BuildContext context) {
    final MapStyle controller = Get.put(MapStyle());
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Theme Settings',
                    // style: TextStyle(
                    //   color: Colors.blueGrey,
                    // ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            const Divider(),
            SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                    child: Text('Map Layers'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.changeStyle('dark');
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 70,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/image/darkmap.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Dark Map',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
