import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';

import '../../Api Services/Api_Config/apiData.dart';
import '../../controller/map_style/map_controller.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MapStyle controller = Get.put(MapStyle());
    return FlutterMap(
      options: MapOptions(
        center: ApiData.routepoints[0],
        zoom: 9,
      ),
      children: [
        TileLayer(
          urlTemplate: controller.mapStyle,
          subdomains: const ['a', 'b', 'c'],

          // userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            for (int i = 0; i < ApiData.routepoints.length; i++)
              Marker(
                point: ApiData.routepoints[i],
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
      ],
    );
  }
}
