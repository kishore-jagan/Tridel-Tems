import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:temskishore/Widgets/Right_drawer/Widget/drawer_drop.dart';
import 'package:temskishore/Widgets/Right_drawer/Widget/drawer_tick.dart';

class DashboardFilterDrawer extends StatefulWidget {
  const DashboardFilterDrawer({super.key});

  @override
  State<DashboardFilterDrawer> createState() => _DashboardFilterDrawerState();
}

class _DashboardFilterDrawerState extends State<DashboardFilterDrawer> {
  final MultiSelectController _controller = MultiSelectController();

  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'WQ 2', value: '2'),
  ];

  final String _selectedParameterType = 'Water Quality';
  final List<String> _listParameterType = ['Water Quality'];
  final String _selectedParameter = 'Water Temprature';
  final List<String> _listParameter = [
    'Water Temprature',
    'Specific Conductance',
    'Salinity',
    'pH',
    'Dissolved Oxygen Saturation',
    'Turbidity',
    'Dissolved Oxygen',
    'tds',
    'Chlorophyll',
    'Depth',
    'Oxygen Reduction Potential',
    'External Voltage'
  ];

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
                    options: items,
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
                      val: _selectedParameterType,
                      items: _listParameterType),
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
