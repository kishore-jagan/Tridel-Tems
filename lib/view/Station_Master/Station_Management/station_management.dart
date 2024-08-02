import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../Widgets/Appbar/appbar.dart';
import '../../../Widgets/Left_drawer/drawer_left.dart';
import '../../Homepage/homepage.dart';
import 'Tabs/calibration_details.dart';
import 'Tabs/station_details.dart';
import 'Tabs/stationmeta_details.dart';

class StationManagementPage extends StatefulWidget {
  const StationManagementPage({super.key});

  @override
  State<StationManagementPage> createState() => _StationManagementPageState();
}

class _StationManagementPageState extends State<StationManagementPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(context),
      drawer: const DrawerLeft(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Station Management',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Get.to(() => const HomePage()),
                    child: const Text(
                      'Home',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    height: 15,
                    width: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => const StationManagementPage()),
                    child: const Text(
                      'Station Management',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              // isScrollable: true,
              labelColor: Colors.lightBlue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color.fromRGBO(3, 169, 244, 1),
              tabs: const [
                Tab(
                  text: 'Station Details',
                ),
                Tab(
                  text: 'Station meta details',
                ),
                Tab(
                  text: 'Calibration details',
                )
              ],
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: const [
              StationDetails(),
              StationMetaDetails(),
              CalibrationDetails(),
            ]))
          ],
        ),
      ),
    );
  }
}
