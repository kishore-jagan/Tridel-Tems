import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../Widgets/usermanagement_text.dart';
import '../Widgets/usermanagemnet_drop.dart';

class CustomRoleManagement extends StatefulWidget {
  const CustomRoleManagement({super.key});

  @override
  State<CustomRoleManagement> createState() => _CustomRoleManagementState();
}

class _CustomRoleManagementState extends State<CustomRoleManagement> {
  final TextEditingController _roleName = TextEditingController();
  final TextEditingController _roleDescription = TextEditingController();
  final MultiSelectController _multiSelectController = MultiSelectController();

  String _selectedModule = 'Dashboard';
  final List<String> _listModule = [
    'Dashboard',
    'Reports',
    'Statistics',
    'Station Meta Details',
    'Calibration Details',
    'Dashboard Settings',
    'Parameter Settings',
    'Data Upload',
    'Data QA/QC',
    'Maintenance Settings',
    'Maintenance Dashboard',
    'Maintenance Report',
    'Maintenance Request',
    'Notification Settings',
    'User Action Log',
    'Station Communication'
  ];

  List<String> _selectedOpeartion = [];
  List<ValueItem> items = [
    const ValueItem(label: 'view', value: '1'),
    const ValueItem(label: 'Edit', value: '2'),
  ];

  final List<String> _getRoleName = [];
  final List<String> _getModule = [];
  final List<String> _getOperation = [];

  void editRow(int index) {
    setState(() {
      _roleName.text = _getRoleName[index];
    });
  }

  void clearFields() {
    setState(() {
      _roleName.clear();
      _roleDescription.clear();
      _selectedModule = 'Dashboard';
      _getOperation.clear();
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
                'User Role',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              UserManagementText(
                  fieldText: 'Role Name', userTextController: _roleName),
              UserManagementText(
                  fieldText: 'Role Description',
                  userTextController: _roleDescription),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columnSpacing: 10,
                    headingRowHeight: 100,
                    columns: [
                      DataColumn(
                          label: SizedBox(
                        width: 150,
                        child: UserManagementDrop(
                            fieldTitle: 'Module*',
                            val: _selectedModule,
                            items: _listModule,
                            onChanged: (newValue) => setState(() {
                                  _selectedModule = newValue!;
                                })),
                      )),
                      DataColumn(
                        label: SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 18.0, bottom: 4.0),
                                child: Text(
                                  'Operation',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              SizedBox(
                                height: 48,
                                child: MultiSelectDropDown(
                                  showClearIcon: true,
                                  controller: _multiSelectController,
                                  onOptionSelected: (options) {
                                    setState(() {
                                      _selectedOpeartion = options
                                          .map((item) => item.label)
                                          .toList();
                                    });
                                  },
                                  options: items,
                                  selectionType: SelectionType.multi,
                                  chipConfig:
                                      const ChipConfig(wrapType: WrapType.wrap),
                                  dropdownHeight: 300,
                                  optionTextStyle:
                                      const TextStyle(fontSize: 16),
                                  showChipInSingleSelectMode: true,
                                  selectedOptionIcon:
                                      const Icon(Icons.check_circle),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                          label: Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 4.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _getModule.add(_selectedModule);
                              _getOperation.add(_selectedOpeartion.toString());
                            });
                          },
                          child: Center(
                            child: Container(
                              height: 30,
                              width: 30,
                              color: Colors.lightBlue,
                              child: const Center(
                                  child: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ),
                      )),
                    ],
                    rows: List.generate(
                        _getModule.length,
                        (index) => DataRow(cells: [
                              DataCell(Text(_getModule[index])),
                              DataCell(Text(_getOperation[index])),
                              DataCell(IconButton(
                                  onPressed: () {
                                    _getModule.removeAt(index);
                                    _getOperation.removeAt(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )))
                            ]))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _getRoleName.add(_roleName.text);
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
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columnSpacing: 20,
                      columns: const [
                        DataColumn(
                          label: Text('Role Name'),
                        ),
                        DataColumn(
                          label: Text('Action'),
                        ),
                      ],
                      rows: List.generate(
                          _getRoleName.length,
                          (index) => DataRow(cells: [
                                DataCell(Text(_getRoleName[index])),
                                DataCell(IconButton(
                                    onPressed: () => editRow(index),
                                    icon: const Icon(Icons.edit))),
                              ]))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

