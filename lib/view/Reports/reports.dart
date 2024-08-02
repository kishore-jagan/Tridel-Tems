import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Api Services/Api_Config/apiData.dart';
import '../../Api Services/Api_Config/api_config.dart';
import '../../Api Services/Api_Config/encryptKey.dart';
import '../../Utils/string.dart';
import '../../Widgets/Appbar/appbar.dart';
import '../../Widgets/Left_drawer/drawer_left.dart';
import '../../Widgets/Right_drawer/Widget/float_button.dart';
import '../../controller/Drawer_Controller/drawer_controller.dart';
import '../../model/Api_models/getSensorHistory_model.dart';
import '../../model/Statistics/linechart_model.dart';
import '../Homepage/homepage.dart';
import 'Widgets/icon_popup.dart';
import 'Widgets/report_drop.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController _searchController = TextEditingController();

  final String _itemsSelected = '10 Items';
  final List<String> _items = ['5 Items', '10 Items', '20 Items'];

  final MainDrawerString _drawer = Get.put(MainDrawerString());
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  List<RSensorParameters> _sensorData = [];

  @override
  void initState() {
    super.initState();
    dataEncrypt(1, '2024-03-03T12:12:50', '2024-04-25T12:12:50');
  }

  void dataEncrypt(int id, String d1, String d2) {
    print("*****started ****");
    String encryptId = encryptAES(id.toString(), ApiConfig.aesKey);
    String encryptD1 = encryptAES(d1, ApiConfig.aesKey);
    String encryptD2 = encryptAES(d2, ApiConfig.aesKey);
    setState(() {
      ApiData.stationId = encryptId;
      ApiData.fromDate = encryptD1;
      ApiData.toDate = encryptD2;
    });

    _fetchReportData(encryptId, encryptD1, encryptD2);
  }

  Future<void> _fetchReportData(String id, String d1, String d2) async {
    print("report data fetch ********");
    var response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/api/sensors/history/by-station-ids?stationIds=$id&fromDate=$d1&toDate=$d2'),
        headers: {
          "Authorization": ApiConfig.bearerToken,
          "apiKey": ApiConfig.apiKey,
          "Content-type": "application/json"
        });
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);

      List<SensorHistory> list = (data['stationDetails'] as List)
          .map((e) => SensorHistory.fromJson(e))
          .toList();

      for (var sensor in list) {
        List<RSensorss> one = sensor.sensors;
        for (var param in one) {
          List<RSensorParameters> two = param.sensorParams;

          setState(() {
            _sensorData = two;
          });
        }
      }
      print("report Data fetched *******");
    } else {
      print(response.body);
    }
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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Reports',
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
                  onTap: () => Get.to(() => const ReportPage()),
                  child: const Text(
                    'Reports',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          _drawer.drawerValue = 'reportfilter';
                        });
                        key.currentState!.openEndDrawer();
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue, width: 1),
                        ),
                        child: const Center(
                            child: Text(
                          '+ Filter',
                          style:
                              TextStyle(color: Colors.lightBlue, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Water Quality',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                IconPopup(
                    icon: SvgPicture.asset(
                      'assets/svg/report_filter.svg',
                      color: Colors.lightBlue,
                    ),
                    text1: 'All',
                    text2: 'Valid Data',
                    text3: 'QA/QC Data'),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.lightBlue),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/svg/report_print.svg',
                          color: Colors.lightBlue)),
                ),
                const Spacer(),
                IconPopup(
                    icon: SvgPicture.asset(
                      'assets/svg/report_download.svg',
                      color: Colors.lightBlue,
                    ),
                    text1: 'Copy',
                    text2: 'CSV',
                    text3: 'PDF'),
                const SizedBox(width: 10),
                ReportDrop(val: _itemsSelected, items: _items)
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: Colors.grey.withOpacity(0.3))
                      ]),
                  child: PaginatedDataTable(
                    header: Text('Report Data'),
                    columns: [
                      DataColumn(
                          label: Text(
                        'Station Name',
                        textAlign: TextAlign.center,
                      )),
                      DataColumn(
                          label: Text(
                        'Date',
                        textAlign: TextAlign.center,
                      )),
                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Water Level(m)')),
                    ],
                    source: _UserDataSource(context, _sensorData),
                    rowsPerPage: 8,
                    columnSpacing: 10, // Change as per your requirement
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

class _UserDataSource extends DataTableSource {
  final BuildContext context;
  final List<RSensorParameters> users;

  _UserDataSource(this.context, this.users);

  @override
  DataRow? getRow(int index) {
    // print("Processing sensor data for index $index");

    if (index >= users.length) return null;
    print("Users length: ${users.length}");
    // List<ChartDataModel> chartData = [];
    // print(chartData);
    // / Access sensors directly

    // Iterate through each sensor and extract sensor parameters
    List<DataCell> sensorCells = [];

    // var sensor = users[index];

    // // Parse sensor data
    // double sensorData = double.tryParse(sensor.data) ?? 0.0;
    // DateTime sensorDateTime = DateTime.tryParse(sensor.date) ?? DateTime.now();

    // // Create ChartDataModel instance
    // ChartDataModel sensorChartData = ChartDataModel(sensorDateTime, sensorData);

    // // Add to chartData list
    // chartData.add(sensorChartData);

    // // Logging statement to check if chartData is empty
    // print("chartData: $chartData");

    for (var sensor in users) {
      // int dataValue = 0;

      // final chartDatas = ChartDataModel(
      //     DateTime.parse(sensor.date), double.parse(sensor.data));
      // chartData.add(chartDatas);
      //  Access specific sensor parameter data (replace 0 with desired index)
      String paramName = sensor.paramName;
      String date = sensor.data;
      String time = sensor.time;
      String data = sensor.data;
      List<String> timeParts = time.split(':');
      String formattedTime = timeParts.sublist(0, 2).join(':');

      // Create DataCell objects for sensor parameters
      sensorCells.add(DataCell(Text(paramName)));
      sensorCells.add(DataCell(Text(date)));
      sensorCells.add(DataCell(Text(formattedTime)));
      sensorCells.add(DataCell(Center(child: Text(data))));

      // ApiController().chartDataSet(chartData);
    }

    return DataRow(cells: sensorCells); // Only sensor data cells
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}

class ReportChart extends StatelessWidget {
  final List<RSensorParameters> sensorData;

  const ReportChart({Key? key, required this.sensorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<ChartDataModel> chartData = [];
    // Create chart data from sensor data
    List<ChartDataModel> chartData = sensorData.map((sensor) {
      double sensorValue = double.tryParse(sensor.data) ?? 0.0;

      DateTime sensorDateTime =
          DateTime.tryParse(sensor.date) ?? DateTime.now();
      return ChartDataModel(sensorDateTime, sensorValue);
    }).toList();
    print("ChartData: $chartData");
    // Use chartData to display the chart
    return Container(
        // Your chart widget here, using chartData
        );
  }
}
