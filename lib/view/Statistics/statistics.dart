import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/string.dart';
import '../../Widgets/Appbar/appbar.dart';
import '../../Widgets/Left_drawer/drawer_left.dart';
import '../../Widgets/Right_drawer/Widget/float_button.dart';

import '../../controller/Drawer_Controller/drawer_controller.dart';
import '../Homepage/homepage.dart';
import 'widgets/linechart.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({
    super.key,
  });

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final MainDrawerString _drawer = Get.put(MainDrawerString());
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: bar(context),
      drawer: const DrawerLeft(),
      endDrawer: const EndDrawerSelection(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Statistics',
                          style: TextStyle(fontSize: 25),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Get.to(const HomePage()),
                              child: const Text(
                                'Home',
                                style: TextStyle(fontSize: 15),
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
                              onTap: () => Get.to(() => const StatisticsPage()),
                              child: const Text(
                                'Statistics',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _drawer.drawerValue = 'statisticsfilter';
                        });
                        key.currentState!.openEndDrawer();
                      },
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue, width: 1),
                        ),
                        child: const Center(
                            child: Text(
                          '+ Filter',
                          style:
                              TextStyle(color: Colors.lightBlue, fontSize: 18),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: const LineChartView(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 50,
                              color: Colors.redAccent,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('WQ 1')
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
