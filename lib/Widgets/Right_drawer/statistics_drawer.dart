import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../Api Services/getAllSensors_Params_service.dart';
import '../../Api Services/getAllStations_service.dart';
import '../../model/Api_models/getAllSensors_Params_model.dart';
import '../../model/Api_models/getAllStations_model.dart';
import 'Widget/drawer_text.dart';
import 'Widget/drawer_tick.dart';

class StatisticsFilterDrawer extends StatefulWidget {
  const StatisticsFilterDrawer({super.key});

  @override
  State<StatisticsFilterDrawer> createState() => _StatisticsFilterDrawerState();
}

class _StatisticsFilterDrawerState extends State<StatisticsFilterDrawer> {
  final MultiSelectController _stationController = MultiSelectController();
  final MultiSelectController _parameterController = MultiSelectController();

  DateTime? _startDate;
  DateTime? _endDate;

  void _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _startDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        selectableDayPredicate: (DateTime date) => date.day <= 31);
    if (pickedDate != null && pickedDate != _startDate) {
      setState(() {
        _startDate = pickedDate;
      });
    }
  }

  void _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) => date.day <= 31,
    );
    if (pickedDate != null && pickedDate != _endDate) {
      setState(() {
        _endDate = pickedDate;
      });
    }
  }

  List<ValueItem> stationName = [];
  List<ValueItem> parameterName = [];

  @override
  void initState() {
    super.initState();
    _fetchStations();
    _fetchSensors();
  }

  _fetchStations() async {
    try {
      // Fetch stations using GetAllStationsService
      List<Station> stations = await GetAllStationsService().getAllStations();

      // Populate items with fetched stations
      setState(() {
        stationName = stations
            .map((station) => ValueItem(
                label: station.stationName,
                value: station.stationId.toString()))
            .toList();
      });
    } catch (e) {
      print('Error fetching stations: $e');
    }
  }

  _fetchSensors() async {
    try {
      List<Sensor> sensors = await GetAllSensorsService().getAllSensors();

      setState(() {
        parameterName = sensors.first.sensorParams
            .map((sensor) => ValueItem(
                label: sensor.parameterName,
                value: sensor.sensorParamId.toString()))
            .toList();
      });
    } catch (e) {
      print('Error fetching sensors: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Advance Customization'),
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close)),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Station*',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  MultiSelectDropDown(
                    backgroundColor: Colors.white10,
                    showClearIcon: false,
                    controller: _stationController,
                    onOptionSelected: (options) {
                      debugPrint(options.toString());
                    },
                    options: stationName,
                    selectionType: SelectionType.multi,
                    chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                    dropdownHeight: 300,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    showChipInSingleSelectMode: true,
                    selectedOptionTextColor: Colors.lightBlue,
                  ),
                  DrawerTick(val: 'All Stations'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DrawerText(
                    fieldText: 'From Date*',
                    textController: TextEditingController(
                      text: _startDate == null
                          ? 'Select Start Date'
                          : DateFormat('yyyy-MM-dd').format(_startDate!),
                    ),
                    onTap: () => _selectStartDate(context),
                  ),
                  DrawerText(
                    fieldText: 'To Date',
                    textController: TextEditingController(
                      text: _endDate == null
                          ? 'Select Start Date'
                          : DateFormat('yyyy-MM-dd').format(_endDate!),
                    ),
                    onTap: () => _selectEndDate(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Parameters*',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  MultiSelectDropDown(
                    backgroundColor: Colors.white10,
                    showClearIcon: false,
                    controller: _parameterController,
                    onOptionSelected: (options) {
                      debugPrint(options.toString());
                    },
                    options: parameterName,
                    selectionType: SelectionType.multi,
                    chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                    dropdownHeight: 300,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    showChipInSingleSelectMode: true,
                    selectedOptionTextColor: Colors.lightBlue,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.lightBlue,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        // border: Border.all(color: Colors.blue, strokeAlign: 1),
                        color: Colors.lightBlue),
                    child: const Center(
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
