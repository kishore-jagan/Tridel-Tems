import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

import '../../../controller/map_style/map_controller.dart';
import '../../../model/Map/latlng_model.dart';

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
                center: RoutePoints().routepoints[0],
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
                    Marker(
                      point: RoutePoints().routepoints[0],
                      builder: (ctx) => InkWell(
                        child: Image.asset(
                          isActive[0]
                              ? 'assets/image/onlinebuoy.png'
                              : 'assets/image/offlinebuoy.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Marker(
                      point: RoutePoints().routepoints[1],
                      builder: (ctx) => InkWell(
                        child: Image.asset(
                          isActive[1]
                              ? 'assets/image/onlinebuoy.png'
                              : 'assets/image/offlinebuoy.png',
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
                      point: RoutePoints().routepoints[0],
                      radius: 25,
                      color: Colors.red.withOpacity(0.5),
                      borderColor: Colors.red,
                      borderStrokeWidth: 2,
                    ),
                    CircleMarker(
                      point: RoutePoints().routepoints[0],
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
