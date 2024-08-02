import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:temskishore/view/Admin_Center/User_Management/Widgets/usermanagement_pwd.dart';
import 'package:temskishore/view/Admin_Center/User_Management/Widgets/usermanagement_text.dart';
import 'package:temskishore/view/Admin_Center/User_Management/Widgets/usermanagement_tick.dart';
import 'package:temskishore/view/Admin_Center/User_Management/Widgets/usermanagemnet_drop.dart';

class UserManagementTab extends StatefulWidget {
  const UserManagementTab({super.key});

  @override
  State<UserManagementTab> createState() => _UserManagementTabState();
}

class _UserManagementTabState extends State<UserManagementTab> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _designation = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final MultiSelectController _multiSelectController = MultiSelectController();

  String _selectedRole = 'PMANAGER';
  final List<String> _listRoles = [
    'PMANAGER',
    'CMANAGER',
    'ENGINEER',
    'USER',
    'QA/QC MANAGER'
  ];

  bool isShow = true;
  bool isChecked = false;

  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'WQ 2', value: '2')
  ];

  final List<String> _getUserName = [];
  final List<String> _getName = [];
  final List<String> _getRole = [];
  final List<String> _getEmail = [];

  void editRow(int index) {
    setState(() {
      _userName.text = _getUserName[index];
      _name.text = _getName[index];
      _selectedRole = _getRole[index];
      _email.text = _getEmail[index];
    });
  }

  void clearFields() {
    setState(() {
      _userName.clear();
      _name.clear();
      _selectedRole = 'PMANAGER';
      _designation.clear();

      _email.clear();
      _password.clear();
      _confirmPassword.clear();
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
                'Add New User',
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
                  fieldText: 'User Name*', userTextController: _userName),
              UserManagementText(fieldText: 'Name*', userTextController: _name),
              UserManagementText(
                  fieldText: 'Designation*', userTextController: _designation),
              UserManagementDrop(
                  fieldTitle: 'User Role*',
                  val: _selectedRole,
                  items: _listRoles,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRole = newValue!;
                    });
                  }),
              UserManagementText(
                  fieldText: 'Email*', userTextController: _email),
              UserManagementPwd(
                  fieldPwd: 'Password*', show: isShow, controller: _password),
              UserManagementPwd(
                  fieldPwd: 'Confirm Password*',
                  show: isShow,
                  controller: _confirmPassword),
              const SizedBox(
                height: 10.0,
              ),
              UserManagementTick(val: 'All Stations', show: isChecked),
              const SizedBox(
                height: 10.0,
              ),
              MultiSelectDropDown(
                showClearIcon: false,
                controller: _multiSelectController,
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
                selectedOptions: isChecked ? items : [],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_getUserName.isEmpty) {
                          _getUserName.add(_userName.text);
                          _getName.add(_name.text);
                          _getRole.add(_selectedRole);
                          _getEmail.add(_email.text);
                        } else {
                          int lastIndex = _getUserName.length - 1;
                          _getUserName[lastIndex] = _userName.text;
                          _getName[lastIndex] = _name.text;
                          _getRole[lastIndex] = _selectedRole;
                          _getEmail[lastIndex] = _email.text;
                        }
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
                            width: 60,
                            child: Text('User Name', softWrap: true),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 60,
                            child: Text('Name', softWrap: true),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 60,
                            child: Text('Role', softWrap: true),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 60,
                            child: Text('Email', softWrap: true),
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
                          _getUserName.length,
                          (index) => DataRow(cells: [
                                DataCell(Text(_getUserName[index])),
                                DataCell(Text(_getName[index])),
                                DataCell(Text(_getRole[index])),
                                DataCell(Text(_getEmail[index])),
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
