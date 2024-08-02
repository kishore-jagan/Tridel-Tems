import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '../../Api Services/getAllSensors_Params_service.dart';
import '../../Api Services/getAllStations_service.dart';
import '../../model/Api_models/getAllSensors_Params_model.dart';
import 'Widget/drawer_drop.dart';
import 'Widget/drawer_tick.dart';

class DashboardFilterDrawer extends StatefulWidget {
  const DashboardFilterDrawer({super.key});

  @override
  State<DashboardFilterDrawer> createState() => _DashboardFilterDrawerState();
}

class _DashboardFilterDrawerState extends State<DashboardFilterDrawer> {
  MultiSelectController _controller = MultiSelectController();

  List<ValueItem> _selectedStationName = [];
  List<ValueItem> _listStationName = [];

  String _selectedSensorType = ' ';
  List<String> _sensorTypes = [];
  String _selectedParameter = '';
  List<String> _listParameter = [];

  @override
  void initState() {
    super.initState();
    _fetchStations();
    _fetchSensors();
  }

  _fetchStations() async {
    try {
      List<ValueItem> stations = await GetAllStationsService()
          .getAllStations()
          .then((stations) => stations
              .map((station) => ValueItem(
                    label: station.stationName,
                    value: station.stationId.toString(),
                  ))
              .toList());

      // Populate items with fetched stations
      setState(() {
        _listStationName = stations;
        if (_listStationName.isNotEmpty) {
          _selectedStationName = [_listStationName.first];
        }
      });
    } catch (e) {
      print('Error fetching stations: $e');
    }
  }

  _fetchSensors() async {
    try {
      List<Sensor> sensors = await GetAllSensorsService().getAllSensors();

      setState(() {
        _sensorTypes = sensors.map((sensor) => sensor.sensorName).toList();
        _selectedSensorType = _sensorTypes.isNotEmpty ? _sensorTypes.first : '';

        if (sensors.isNotEmpty) {
          _listParameter = sensors.first.sensorParams
              .map((param) => param.parameterName)
              .toList();
          _selectedParameter =
              _listParameter.isNotEmpty ? _listParameter.first : '';
        }
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
                    controller: _controller,
                    onOptionSelected: (options) {
                      debugPrint(options.toString());
                    },
                    options: _listStationName,
                    selectedOptions: _selectedStationName,
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
                  DrawerDrop(
                      fieldTitle: 'Parameter Type*',
                      val: _selectedSensorType,
                      items: _sensorTypes),
                  DrawerDrop(
                      fieldTitle: 'Parameter',
                      val: _selectedParameter,
                      items: _listParameter),
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
