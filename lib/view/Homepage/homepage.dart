import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/map_style/map_controller.dart';
import '../../Widgets/Appbar/appbar.dart';
import '../../Widgets/Left_drawer/drawer_left.dart';
import '../../Widgets/Map/map_page.dart';
import '../../Widgets/Right_drawer/Widget/float_button.dart';
import '../../Widgets/Right_drawer/drawer_right.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MapStyle controller = Get.put(MapStyle());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: bar(context),
      drawer: const DrawerLeft(),
      body: _buildMapView(),
      endDrawer: const DrawerRight(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatButton(),
    );
  }

  Widget _buildMapView() {
    return GetX<MapStyle>(
      init: MapStyle(),
      builder: (controller) {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const MapPage();
      },
    );
  }
}
