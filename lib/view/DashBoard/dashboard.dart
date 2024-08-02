import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Api Services/getAllStations_service.dart';
import '../../Utils/string.dart';
import '../../Widgets/Appbar/appbar.dart';
import '../../Widgets/Left_drawer/drawer_left.dart';
import '../../Widgets/Right_drawer/Widget/float_button.dart';
import '../../controller/Drawer_Controller/drawer_controller.dart';
import '../../model/Api_models/getAllStations_model.dart';
import '../Homepage/homepage.dart';
import 'Widget/buoy_watch_circle.dart';
import 'Widget/dash_drop.dart';
import 'Widget/headline.dart';
import 'Widget/temperature_gauge.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final MainDrawerString _drawer = Get.put(MainDrawerString());
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  DateTime? lastupdated;

  @override
  void initState() {
    super.initState();
    getDate();
    _fetchStations();
  }

  void getDate() {
    DateTime todayDate = DateTime.now();
    setState(() {
      lastupdated = todayDate;
    });
  }

  List<dynamic> dataValue = [
    {
      'text': 'Specific Conductance',
      'value': '12006 mS/cm',
      'icon': 'assets/svg/specific_conductance.svg',
    },
    {
      'text': 'Salinity',
      'value': '6.93 PSU',
      'icon': 'assets/svg/salinity.svg',
    },
    {
      'text': 'pH',
      'value': '7.31',
      'icon': 'assets/svg/pH.svg',
    },
    {
      'text': 'Dissolved Oxygen Saturation',
      'value': '85.5 %',
      'icon': 'assets/svg/dos.svg',
    },
    {
      'text': 'Turbidity',
      'value': '7.28 NTU',
      'icon': 'assets/svg/turbidity.svg',
    },
    {
      'text': 'Dissolved Oxygen',
      'value': '7.88 mg/L',
      'icon': 'assets/svg/dissolved_oxygen.svg',
    },
    {
      'text': 'tds',
      'value': '7.8 ppt',
      'icon': 'assets/svg/tds.svg',
    },
    {
      'text': 'Chlorophyll',
      'value': '0.01 RFU',
      'icon': 'assets/svg/chlorophyll.svg',
    },
    {'text': 'Depth', 'value': '0.61 ft', 'icon': 'assets/svg/depth.svg'},
    {
      'text': 'Oxidation Reduction Potential',
      'value': '6.93 PSU',
      'icon': 'assets/svg/orp.svg',
    },
    {
      'text': 'External Voltage',
      'value': '13.3 V',
      'icon': 'assets/svg/external_voltage.svg',
    },
  ];

  String _selectedStationName = '';
  List<String> _liststationName = [];

  _fetchStations() async {
    try {
      // Fetch stations using GetAllStationsService
      List<Station> stations = await GetAllStationsService().getAllStations();

      // Populate items with fetched stations
      setState(() {
        _liststationName =
            stations.map((station) => station.stationName).toList();
        _selectedStationName =
            _liststationName.isNotEmpty ? _liststationName.first : '';
      });
    } catch (e) {
      print('Error fetching stations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: bar(context),
      drawer: const DrawerLeft(),
      endDrawer: const EndDrawerSelection(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          children: [
            Column(
              children: [
                const HeadLine(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const HeadLine(),
                      const Text(
                        'Dashboard',
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
                            onTap: () => Get.to(() => const DashBoardPage()),
                            child: const Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Last Updated : ',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          Text('$lastupdated'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'WQ Selection',
                        style: TextStyle(color: Colors.lightBlue, fontSize: 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: DashBoardDrop(
                                  val: _selectedStationName,
                                  items: _liststationName)),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _drawer.drawerValue = 'dashboardfilter';
                                });
                                _key.currentState!.openEndDrawer();
                              },
                              child: Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 1),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 400,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage('assets/image/bg-image.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Buoy Watch Circle',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          WatchCirlce(),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Water',
                          style: TextStyle(
                              color: Colors.lightBlue, fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TemparatureGauge(),
                      ),

                      Column(
                        children: [
                          for (int i = 0; i < dataValue.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.only(top: 40),
                                height: 260,
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: const Offset(0, 1),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: SvgPicture.asset(
                                            '${dataValue[i]['icon']}',
                                            // ignore: deprecated_member_use
                                            color: Colors.white,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      dataValue[i]['value'].toString(),
                                      style: const TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      dataValue[i]['text'].toString(),
                                      style: const TextStyle(
                                        fontSize: 22,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
