import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../model/Configurations/Parameter/parameter_model.dart';
import '../../widgets/con_drop.dart';
import '../../widgets/con_text.dart';
import '../../widgets/tab_tick.dart';

class ParameterSettings extends StatefulWidget {
  const ParameterSettings({super.key});

  @override
  State<ParameterSettings> createState() => _ParameterSettingsState();
}

class _ParameterSettingsState extends State<ParameterSettings> {
  final TextEditingController _MinimumText = TextEditingController();
  final TextEditingController _MaximumText = TextEditingController();
  final TextEditingController _warningText = TextEditingController();
  final TextEditingController _dangerText = TextEditingController();
  final TextEditingController _roundToText = TextEditingController();
  ParameterModel param = Get.put(ParameterModel());

  final String _sensorSelected = 'Water Quality';
  final List<String> _sensorList = ['Water Quality', 'Others'];

  String _parameterSelected = 'Water Temparature';
  final List<String> _parametersList = [
    'Water Temparature',
    'Specific Conductance',
    'Salinity',
    'pH',
    'Dissolved Oxygen Saturation',
    'Turbidity',
    'Dissolved Oxygen',
    'tds',
    'Depth',
    'Chlorophyll',
    'Water Pressure',
    'Oxidation Reduction Potential',
    'External Voltage'
  ];

  final String _unitSelected = '°C';
  final List<String> _unitList = ['°C'];

  final String _notificationSelected = 'Enabled';

  final List<String> _getParameter = [];
  final List<String> _getUnit = [];
  final List<String> _getWarning = [];
  final List<String> _getDanger = [];
  final List<String> _getNotification = [];

  void editRow(int index) {
    setState(() {
      _parameterSelected = _getParameter[index];
      _getUnit[index] = _unitSelected;
      _getWarning[index] = _warningText.text;
      _getDanger[index] = _dangerText.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Parameter Settings',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Sensors*',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      ConfigDrop(val: _sensorSelected, items: _sensorList),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Parameter*',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      ConfigDrop(
                          val: _parameterSelected, items: _parametersList)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Unit*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigDrop(val: _unitSelected, items: _unitList)
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Minimum Value*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(textController: _MinimumText)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Maximum Value*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(textController: _MaximumText)
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Warning Threshold*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(textController: _warningText)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Danger Threshold*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(textController: _dangerText)
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Round To*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(textController: _roundToText)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TabTick(val: 'Display on home'),
                  const SizedBox(
                    height: 20,
                  ),
                  TabTick(val: 'Enable Notification'),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _getParameter.add(_parameterSelected);
                          _getUnit.add(_unitSelected);
                          _getWarning.add(_warningText.text);
                          _getDanger.add(_dangerText.text);
                          _getNotification.add(_notificationSelected);
                        });
                      },
                      icon: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                            child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text('Water Quality Parameters'),
            const SizedBox(height: 10),
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 15,
                    columns: const [
                      DataColumn(label: Text('Parameter')),
                      DataColumn(label: Text('Unit')),
                      DataColumn(
                        label: SizedBox(
                            width: 70,
                            child: Text('Warning Threshold', softWrap: true)),
                      ),
                      DataColumn(
                        label: SizedBox(
                            width: 70,
                            child: Text('Danger Threshold', softWrap: true)),
                      ),
                      DataColumn(label: Text('Notification')),
                      DataColumn(label: Text('Action'))
                    ],
                    rows: List.generate(
                      _getParameter.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Center(child: Text(_getParameter[index]))),
                          DataCell(Center(child: Text(_getUnit[index]))),
                          DataCell(Center(child: Text(_getWarning[index]))),
                          DataCell(Center(child: Text(_getDanger[index]))),
                          DataCell(
                              Center(child: Text(_getNotification[index]))),
                          DataCell(IconButton(
                              onPressed: () {
                                editRow(index);
                              },
                              icon: const Icon(Icons.edit,
                                  color: Colors.lightBlue))),
                        ],
                      ),
                    ),
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
