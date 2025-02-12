import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import 'Widget/drawer_text.dart';

class DataQaFilterDrawer extends StatefulWidget {
  const DataQaFilterDrawer({super.key});

  @override
  State<DataQaFilterDrawer> createState() => _DataQaFilterDrawerState();
}

class _DataQaFilterDrawerState extends State<DataQaFilterDrawer> {
  final MultiSelectController _controller = MultiSelectController();

  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'WQ 2', value: '2'),
  ];

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
                  const Text('Data QA'),
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
