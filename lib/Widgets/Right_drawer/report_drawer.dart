import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:temskishore/Widgets/Right_drawer/Widget/drawer_date.dart';

import 'Widget/drawer_tick.dart';

class ReportFilterDrawer extends StatefulWidget {
  const ReportFilterDrawer({super.key});

  @override
  State<ReportFilterDrawer> createState() => _ReportFilterDrawerState();
}

class _ReportFilterDrawerState extends State<ReportFilterDrawer> {
  final DrawerDate _drawerDate = Get.put(DrawerDate());
  final MultiSelectController _controller = MultiSelectController();
  final TextEditingController _weekController = TextEditingController();

  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'WQ 2', value: '2'),
  ];

  String _selectedDateRange = 'Date Range';
  final List<String> _listDateRange = [
    'Date Range',
    'Weekly',
    'Monthly',
    'Yearly'
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

  // DateTime? _week;

  void _selectWeek(BuildContext context) async {
    final pickedWeek = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) =>
          date.weekday >= DateTime.monday && date.weekday <= DateTime.sunday,
    );
    if (pickedWeek != null) {
      DateTime startDate =
          pickedWeek.subtract(Duration(days: pickedWeek.weekday - 1));
      DateTime endDate =
          pickedWeek.add(Duration(days: DateTime.sunday - pickedWeek.weekday));
      setState(() {
        _weekController.text =
            '${startDate.day}/${startDate.month}/${startDate.year} - ${endDate.day}/${endDate.month}/${endDate.year}';
      });
    }
  }

  String? _selectedMonth;
  String? _selectedYear;
  final List<String> _listYears = [];

  void yearDropDown() {
    int currentYear = DateTime.now().year;
    for (int year = 2023; year <= currentYear && year <= 2024; year++) {
      _listYears.add(year.toString());
    }
    _selectedYear = _listYears.first;
  }

  @override
  void initState() {
    super.initState();
    yearDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Advance Filtering'),
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close)),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Station*',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                    child: MultiSelectDropDown(
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
                  ),
                  DrawerTick(val: 'All Stations'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Generate for',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedDateRange,
                    isExpanded: true,
                    items: _listDateRange
                        .map((String result) => DropdownMenuItem<String>(
                            value: result, child: Text(result)))
                        .toList(),
                    onChanged: (newValue) => setState(() {
                      _selectedDateRange = newValue!;
                    }),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.3))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                  if (_selectedDateRange == 'Date Range')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            'From Date*',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        TextField(
                          controller: TextEditingController(
                              text: _startDate == null
                                  ? 'Select Start Date'
                                  : DateFormat('dd-MM-yyyy')
                                      .format(_startDate!)),
                          onTap: () => _selectStartDate(context),
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              size: 20,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            'To Date*',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        TextField(
                          controller: TextEditingController(
                              text: _endDate == null
                                  ? 'Select End Date'
                                  : DateFormat('dd-MM-yyyy').format(_endDate!)),
                          onTap: () => _selectEndDate(context),
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              size: 20,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (_selectedDateRange == 'Weekly')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            'Week',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        TextField(
                          controller: _weekController,
                          onTap: () => _selectWeek(context),
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              size: 20,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        )
                      ],
                    ),
                  if (_selectedDateRange == 'Monthly')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            'Year',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          value: _selectedYear,
                          isExpanded: true,
                          items: _listYears
                              .map((String result) => DropdownMenuItem<String>(
                                  value: result, child: Text(result)))
                              .toList(),
                          onChanged: (newValue) => setState(() {
                            _selectedYear = newValue;
                          }),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            'Month',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          value: _selectedMonth,
                          isExpanded: true,
                          items: _drawerDate.months.where((month) {
                            if (_selectedYear == DateTime.now().toString()) {
                              final currentMonth = DateTime.now().month;
                              final monthIndex =
                                  _drawerDate.months.indexOf(month) + 1;
                              return monthIndex <= currentMonth;
                            }
                            return true;
                          }).map((month) {
                            return DropdownMenuItem<String>(
                              value: month,
                              child: Text(month),
                            );
                          }).toList(),
                          onChanged: (newValue) => setState(() {
                            _selectedMonth = newValue;
                          }),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (_selectedDateRange == 'Yearly')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            'Year',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          value: _selectedYear,
                          isExpanded: true,
                          items: _listYears
                              .map((String result) => DropdownMenuItem<String>(
                                  value: result, child: Text(result)))
                              .toList(),
                          onChanged: (newValue) => setState(() {
                            _selectedYear = newValue;
                          }),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),
                      ],
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
