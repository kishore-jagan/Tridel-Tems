import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temskishore/view/Admin_Center/Notification_Settings/Widgets/notification_settings_drop.dart';
import 'package:temskishore/view/Admin_Center/Notification_Settings/Widgets/notification_settings_text.dart';

import '../../../Widgets/Appbar/appbar.dart';
import '../../../Widgets/Left_drawer/drawer_left.dart';
import '../../Homepage/homepage.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _selectedStation = 'WQ 1';
  String _selectedNotification = 'BOTH(WARN & DANGER)';
  String _selectedSensor = 'Water Quality';

  List<String> _stationList = ['WQ 1', 'WQ 2'];
  List<String> _notificationList = [
    'BOTH(WARN & DANGER)',
    'WARN',
    'DANGER',
    'GENERAL(INTRUSION)'
  ];
  List<String> _sensorList = ['Water Quality'];

  List<String> _getStation = [];
  List<String> _getSensor = [];
  List<String> _getNotification = [];
  List<String> _getName = [];
  List<String> _getEmail = [];

  void clearFields() {
    setState(() {
      _selectedStation = 'WQ 1';
      _selectedNotification = 'BOTH(WARN & DANGER)';
      _selectedSensor = 'Water Quality';
      _nameController.clear();
      _emailController.clear();
    });
  }

  void editRow(int index) {
    setState(() {
      _selectedStation = _getStation[index];
      _selectedSensor = _getSensor[index];
      _selectedNotification = _getNotification[index];
      _nameController.text = _getName[index];
      _emailController.text = _getEmail[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(context),
      drawer: const DrawerLeft(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Notification Settings',
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
                        onTap: () =>
                            Get.to(() => const NotificationSettingsPage()),
                        child: const Text(
                          'Notification Settings',
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Notification Recipient',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        NotificationSettingsDrop(
                          fieldTitle: 'Station Name*',
                          val: _selectedStation,
                          items: _stationList,
                        ),
                        NotificationSettingsDrop(
                            fieldTitle: 'Notification Type*',
                            val: _selectedNotification,
                            items: _notificationList),
                        NotificationSettingsDrop(
                            fieldTitle: 'Sensor Type*',
                            val: _selectedSensor,
                            items: _sensorList),
                        NotificationSettingsText(
                            fieldText: 'Name*',
                            TextController: _nameController),
                        NotificationSettingsText(
                            fieldText: 'Email Id*',
                            TextController: _emailController),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => setState(() {
                                _getStation.add(_selectedStation);
                                _getNotification.add(_selectedNotification);
                                _getSensor.add(_selectedSensor);
                                _getName.add(_nameController.text);
                                _getEmail.add(_emailController.text);
                              }),
                              child: Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 7),
                            InkWell(
                              onTap: () {
                                clearFields();
                              },
                              child: Container(
                                height: 40,
                                width: 90,
                                decoration: const BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                child: const Center(
                                  child: Text(
                                    'Clear',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Water Quality Notification Details',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columnSpacing: 10,
                              columns: const [
                                DataColumn(
                                  label: SizedBox(
                                    width: 80,
                                    child: Text('Station Name', softWrap: true),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: 80,
                                    child: Text('Notification Type',
                                        softWrap: true),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: 80,
                                    child: Text('Sensor Type', softWrap: true),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: 80,
                                    child: Text('Name', softWrap: true),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: 80,
                                    child: Text('Email Id', softWrap: true),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: 80,
                                    child: Text('Action', softWrap: true),
                                  ),
                                ),
                              ],
                              rows: List.generate(
                                  _getStation.length,
                                  (index) => DataRow(cells: [
                                        DataCell(Text(_getStation[index])),
                                        DataCell(Text(_getNotification[index])),
                                        DataCell(Text(_getSensor[index])),
                                        DataCell(Text(_getName[index])),
                                        DataCell(Text(_getEmail[index])),
                                        DataCell(IconButton(
                                            onPressed: () {
                                              editRow(index);
                                            },
                                            icon: const Icon(Icons.edit)))
                                      ]))),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
