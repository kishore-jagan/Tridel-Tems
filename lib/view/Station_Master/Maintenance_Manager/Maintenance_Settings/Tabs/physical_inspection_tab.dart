import 'package:flutter/material.dart';
import 'package:temskishore/view/Station_Master/Maintenance_Manager/Maintenance_Settings/Widgets/maintenance_text.dart';

class PhysicalInspectionTab extends StatefulWidget {
  const PhysicalInspectionTab({super.key});

  @override
  State<PhysicalInspectionTab> createState() => _PhysicalInspectionTabState();
}

class _PhysicalInspectionTabState extends State<PhysicalInspectionTab> {
  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _itemCode = TextEditingController();

  final List<String> _getItemName = [];
  final List<String> _getItemCode = [];

  void editRow(int index) {
    setState(() {
      _itemName.text = _getItemName[index];
      _itemCode.text = _getItemCode[index];
    });
  }

  void clearFields() {
    setState(() {
      _itemName.clear();
      _itemCode.clear();
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
                'Add Inspection Item',
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
                  fieldTitle: 'Item Name*', userTextController: _itemName),
              MaintenanceSettingsText(
                  fieldTitle: 'Man Power*', userTextController: _itemCode),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _getItemName.add(_itemName.text);
                        _getItemCode.add(_itemCode.text);
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
                            child: Text('Inspection Item Name', softWrap: true),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 90,
                            child: Text('Inspection Item Code', softWrap: true),
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
                          _getItemName.length,
                          (index) => DataRow(cells: [
                                DataCell(Text(_getItemName[index])),
                                DataCell(Text(_getItemCode[index])),
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
                                            _getItemName.removeAt(index);
                                            _getItemCode.removeAt(index);
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
