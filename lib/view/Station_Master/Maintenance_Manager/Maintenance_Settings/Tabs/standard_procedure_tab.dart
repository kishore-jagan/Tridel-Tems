import 'package:flutter/material.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Settings/Widgets/maintenance_text.dart';

class StandardProcedureTab extends StatefulWidget {
  const StandardProcedureTab({super.key});

  @override
  State<StandardProcedureTab> createState() => _StandardProcedureTabState();
}

class _StandardProcedureTabState extends State<StandardProcedureTab> {
  final TextEditingController _ProcedureName = TextEditingController();
  final TextEditingController _ProcedureCode = TextEditingController();

  final List<String> _getProcedureName = [];
  final List<String> _getProcedureCode = [];

  void editRow(int index) {
    setState(() {
      _ProcedureName.text = _getProcedureName[index];
      _ProcedureCode.text = _getProcedureCode[index];
    });
  }

  void clearFields() {
    setState(() {
      _ProcedureName.clear();
      _ProcedureCode.clear();
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
                'Add Standard Procedure',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              MaintenanceSettingsText(
                  fieldTitle: 'Procedure Name*',
                  userTextController: _ProcedureName),
              MaintenanceSettingsText(
                  fieldTitle: 'Procedure Details*',
                  userTextController: _ProcedureCode),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _getProcedureName.add(_ProcedureName.text);
                        _getProcedureCode.add(_ProcedureCode.text);
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
                            child: Text('Procedure Name', softWrap: true),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('Procedure Details', softWrap: true),
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
                          _getProcedureName.length,
                          (index) => DataRow(cells: [
                                DataCell(Text(_getProcedureName[index])),
                                DataCell(Text(_getProcedureCode[index])),
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
                                            _getProcedureName.removeAt(index);
                                            _getProcedureCode.removeAt(index);
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
