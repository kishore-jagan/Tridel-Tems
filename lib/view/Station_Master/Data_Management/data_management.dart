import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temskishore/Utils/string.dart';
import 'package:temskishore/controller/Drawer_Controller/drawer_controller.dart';

import '../../../Widgets/Appbar/appbar.dart';
import '../../../Widgets/Left_drawer/drawer_left.dart';
import '../../../Widgets/Right_drawer/Widget/float_button.dart';
import '../../Homepage/homepage.dart';
import 'Widgets/Tabs/data_qa.dart';
import 'Widgets/Tabs/dataupload.dart';

class DataManagementPage extends StatefulWidget {
  const DataManagementPage({super.key});

  @override
  State<DataManagementPage> createState() => _DataManagementPageState();
}

class _DataManagementPageState extends State<DataManagementPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final _drawer = Get.put(MainDrawerString());
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future<void> data(String val) async {
    setState(() {
      _drawer.drawerValue = val;
    });
    key.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: bar(context),
      drawer: const DrawerLeft(),
      endDrawer: const EndDrawerSelection(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Management',
              style: TextStyle(fontSize: 25),
            ),
            Row(
              children: <Widget>[
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
                  onTap: () => Get.to(() => const DataManagementPage()),
                  child: const Text(
                    'Data Management',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TabBar(
              // isScrollable: true,
              indicator: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              controller: _tabController,
              // isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.lightBlue,
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Tab(
                    text: 'Data QA',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Tab(
                    text: 'Upload',
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                DataQA(
                  ontap: (p0) => data(p0),
                ),
                DataUpload(
                  ontap: (p0) => data(p0),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
