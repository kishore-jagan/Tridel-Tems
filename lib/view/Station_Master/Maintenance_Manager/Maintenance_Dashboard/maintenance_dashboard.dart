import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Dashboard/Maintenace_Reports/maintenance_reports.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Dashboard/Maintenance_Requests/maintenance_requests.dart';

import '../../../../Widgets/Appbar/appbar.dart';
import '../../../../Widgets/Left_drawer/drawer_left.dart';
import '../../../../Widgets/Right_drawer/Widget/float_button.dart';
import '../../../../Widgets/Right_drawer/drawer_right.dart';
import '../../../Homepage/homepage.dart';
import 'Maintenance_Cycle/maintenance_cycle.dart';

class MaintenanceDashboardPage extends StatefulWidget {
  const MaintenanceDashboardPage({super.key});

  @override
  State<MaintenanceDashboardPage> createState() =>
      _MaintenanceDashboardPageState();
}

class _MaintenanceDashboardPageState extends State<MaintenanceDashboardPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(context),
      drawer: const DrawerLeft(),
      endDrawer: const DrawerRight(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Maintenance Dashboard',
              style: TextStyle(fontSize: 25),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Get.to(() => const HomePage()),
                  child: const Text(
                    'Home',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 15,
                  width: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () => Get.to(() => const MaintenanceDashboardPage()),
                  child: const Text(
                    'Maintenance Module',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              controller: _tabController,
              // isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.lightBlue,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/maintenance_cycle.svg',
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const SizedBox(
                        width: 85,
                        child: Text(
                          'Maintenance Cycle',
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/maintenance_reports.svg',
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const SizedBox(
                        width: 85,
                        child: Text(
                          'Maintenance reports',
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/maintenance_requests.svg',
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const SizedBox(
                        width: 85,
                        child: Text(
                          'Maintenance Requests',
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                MaintenanceCycle(),
                MaintenanceReports(),
                MaintenanceRequest(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
