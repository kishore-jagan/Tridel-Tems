import 'package:flutter/material.dart';

import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Settings/Widgets/maintenance_drop.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Settings/Widgets/maintenance_text.dart';

class ManPowerTab extends StatefulWidget {
  const ManPowerTab({super.key});

  @override
  State<ManPowerTab> createState() => _ManPowerTabState();
}

class _ManPowerTabState extends State<ManPowerTab> {
  final TextEditingController _manPower = TextEditingController();

  String _selectedTeamType = 'Technician';
  final List<String> _listTeamsType = [
    'Technician',
    'Diver',
    'Boat Captain',
    'Safety Engineer',
    'HSE Engineer',
    'Technical Assistant',
    'Driver'
  ];

  final List<String> _getTeamType = [];
  final List<String> _getManPower = [];

  void editRow(int index) {
    setState(() {
      _selectedTeamType = _getTeamType[index];
      _manPower.text = _getManPower[index];
    });
  }

  void clearFields() {
    setState(() {
      _selectedTeamType = 'Technician';
      _manPower.clear();
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
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Add Manpower',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              MaintenanceSettingsDrop(
                  fieldTitle: 'Team Type*',
                  val: _selectedTeamType,
                  items: _listTeamsType,
                  onChanged: (newValue) => setState(() {
                        _selectedTeamType = newValue!;
                      })),
              MaintenanceSettingsText(
                  fieldTitle: 'Man Power*', userTextController: _manPower),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _getTeamType.add(_selectedTeamType);
                        _getManPower.add(_manPower.text);
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
                height: 10.0,
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
                            child: Text('Team Type', softWrap: true),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('Manpower Name', softWrap: true),
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
                          _getTeamType.length,
                          (index) => DataRow(cells: [
                                DataCell(Text(_getTeamType[index])),
                                DataCell(Text(_getManPower[index])),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                        onPressed: () => editRow(index),
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.lightBlue,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _getTeamType.removeAt(index);
                                            _getManPower.removeAt(index);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                )),
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
