import 'package:flutter/material.dart';

import '../Widgets/maintenance_datetime.dart';
import '../Widgets/maintenance_drop.dart';
import '../Widgets/maintenance_tabtick.dart';
import '../Widgets/maintenance_text.dart';

class ConfigurationsTab extends StatefulWidget {
  const ConfigurationsTab({super.key});

  @override
  State<ConfigurationsTab> createState() => _ConfigurationsTabState();
}

class _ConfigurationsTabState extends State<ConfigurationsTab> {
  final TextEditingController _maintenancePeriod = TextEditingController();
  final TextEditingController _maintenanceStart = TextEditingController();
  final TextEditingController _maintenanceEnd = TextEditingController();
  final TextEditingController _cycles = TextEditingController();
  final TextEditingController _notify = TextEditingController();

  String _selectedCycleType = 'WQ 1';
  final List<String> _listCycleType = ['WQ 1', 'WQ 2'];

  DateTime? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context, String find) async {
    final DateTime? pickedDate = await showDatePicker(
        initialDate: _selectedDateTime ?? DateTime.now(),
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      setState(() {
        _selectedDateTime =
            DateTime(pickedDate.year, pickedDate.month, pickedDate.day);
        if (find == 'one') {
          _maintenanceStart.text =
              '${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}';
        } else if (find == 'two') {
          _maintenanceEnd.text =
              '${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}';
        }
      });
    }
  }

  List<String> _getMaintenancePeriod = [];
  List<String> _getMaintenanceStart = [];
  List<String> _getMaintenanceEnd = [];
  List<String> _getMaintenanceCycleType = [];
  List<String> _getCycles = [];
  List<String> _getNotify = [];

  void editRow(int index) {
    setState(() {
      _maintenancePeriod.text = _getMaintenancePeriod[index];
      _maintenanceStart.text = _getMaintenanceStart[index];
      _maintenanceEnd.text = _getMaintenanceEnd[index];

      _selectedCycleType = _getMaintenanceCycleType[index];
      _cycles.text = _getCycles[index];
      _notify.text = _getNotify[index];
    });
  }

  void clearFields() {
    setState(() {
      _maintenancePeriod.clear();
      _maintenanceStart.clear();

      _maintenanceEnd.clear();
      _selectedCycleType = 'WQ 1';
      _cycles.clear();
      _notify.clear();
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              MaintenanceSettingsText(
                  fieldTitle: 'Maintenance Period(Years)*',
                  userTextController: _maintenancePeriod),
              MaintenanceSettingsDateTime(
                  fieldTitle: 'Maintenance Start Date*',
                  onPressed: () => _selectDateTime(context, 'one'),
                  dateTextController: _maintenanceStart),
              MaintenanceSettingsDateTime(
                  fieldTitle: 'Maintenance End Date*',
                  onPressed: () => _selectDateTime(context, 'two'),
                  dateTextController: _maintenanceEnd),
              MaintenanceSettingsDrop(
                  fieldTitle: 'Maintenance Cycle Type*',
                  val: _selectedCycleType,
                  items: _listCycleType,
                  onChanged: (newValue) => setState(() {
                        _selectedCycleType = newValue!;
                      })),
              MaintenanceSettingsText(
                  fieldTitle: 'No of Cycles(Yearly)*',
                  userTextController: _cycles),
              MaintenanceSettingsText(
                  fieldTitle: 'No of Notify Days*',
                  userTextController: _notify),
              const SizedBox(
                height: 20,
              ),
              MaintenanceSettingsTabTick(
                  val: 'Enable Maintenance Notification'),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _getMaintenancePeriod.add(_maintenancePeriod.text);
                        _getMaintenanceStart.add(_maintenanceStart.text);
                        _getMaintenanceEnd.add(_maintenanceEnd.text);
                        _getMaintenanceCycleType.add(_selectedCycleType);
                        _getCycles.add(_cycles.text);
                        _getNotify.add(_notify.text);
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
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
                      height: 30,
                      width: 70,
                      decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
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
                height: 20.0,
              ),
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columnSpacing: 10,
                      columns: const [
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('Maintenance Period',
                                textAlign: TextAlign.center, softWrap: true),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('Maintenance Start Date',
                                textAlign: TextAlign.center, softWrap: true),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('Maintenance End Date',
                                softWrap: true, textAlign: TextAlign.center),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('Maintenance Cycle Type*',
                                softWrap: true, textAlign: TextAlign.center),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('No of Cycles',
                                softWrap: true, textAlign: TextAlign.center),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('No of Notify Days*',
                                softWrap: true, textAlign: TextAlign.center),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 60,
                            child: Text('Action', softWrap: true),
                          ),
                        ),
                      ],
                      rows: List.generate(
                          _getMaintenancePeriod.length,
                          (index) => DataRow(cells: [
                                DataCell(Text(_getMaintenancePeriod[index])),
                                DataCell(Text(_getMaintenanceStart[index])),
                                DataCell(Text(_getMaintenanceEnd[index])),
                                DataCell(Text(_getMaintenanceCycleType[index])),
                                DataCell(Text(_getCycles[index])),
                                DataCell(Text(_getNotify[index])),
                                DataCell(IconButton(
                                    onPressed: () => editRow(index),
                                    icon: const Icon(Icons.edit))),
                              ]))),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
