import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Settings/Tabs/configurations_tab.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Settings/Tabs/manpower_tab.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Settings/Tabs/physical_inspection_tab.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Settings/Tabs/standard_procedure_tab.dart';

import '../../../../Widgets/Appbar/appbar.dart';
import '../../../../Widgets/Left_drawer/drawer_left.dart';
import '../../../../Widgets/Right_drawer/Widget/float_button.dart';
import '../../../../Widgets/Right_drawer/drawer_right.dart';
import '../../../Homepage/homepage.dart';

class MaintenanceSettingsPage extends StatefulWidget {
  const MaintenanceSettingsPage({super.key});

  @override
  State<MaintenanceSettingsPage> createState() =>
      _MaintenanceSettingsPageState();
}

class _MaintenanceSettingsPageState extends State<MaintenanceSettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configurations',
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
                  onTap: () => Get.to(() => const MaintenanceSettingsPage()),
                  child: const Text(
                    'Maintenance Settings',
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
              controller: _tabController,
              // isScrollable: true,
              labelColor: Colors.lightBlue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.lightBlue,
              tabs: const [
                Tab(
                  text: 'Configuration',
                ),
                Tab(
                  text: 'Man Power',
                ),
                Tab(
                  child: SizedBox(
                    width: 80,
                    child: Text(
                      'Physical Inspection',
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: 80,
                    child: Text(
                      'Standard Procedure',
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: const [
              ConfigurationsTab(),
              ManPowerTab(),
              PhysicalInspectionTab(),
              StandardProcedureTab(),
            ]))
          ],
        ),
      ),
    );
  }
}
