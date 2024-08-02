import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

import '../../../Api Services/Api_Config/apiData.dart';
import '../../../controller/map_style/map_controller.dart';

class ExpandBuoyCircle extends StatefulWidget {
  const ExpandBuoyCircle({super.key});

  @override
  State<ExpandBuoyCircle> createState() => _ExpandBuoyCircleState();
}

class _ExpandBuoyCircleState extends State<ExpandBuoyCircle> {
  final MapStyle controller = Get.put(MapStyle());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: ApiData.routepoints[0],
                zoom: 9,
              ),
              children: [
                TileLayer(
                  urlTemplate: controller.mapStyle,
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    for (int i = 0; i < ApiData.routepoints.length; i++)
                      Marker(
                        point: ApiData.routepoints[iOSHorizontalOffset],
                        builder: (ctx) => InkWell(
                          child: Image.asset(
                            'assets/image/onlinebuoy.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                  ],
                ),
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: ApiData.routepoints[0],
                      radius: 25,
                      color: Colors.red.withOpacity(0.5),
                      borderColor: Colors.red,
                      borderStrokeWidth: 2,
                    ),
                    CircleMarker(
                      point: ApiData.routepoints[0],
                      radius: 13.5,
                      color: Colors.yellow.withOpacity(0.5),
                      borderColor: Colors.yellow,
                      borderStrokeWidth: 2,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.fullscreen_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
