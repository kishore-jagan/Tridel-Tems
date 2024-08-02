import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/Appbar/appbar.dart';
import '../../../Widgets/Left_drawer/drawer_left.dart';
import '../../Homepage/homepage.dart';

class UserActionLog extends StatefulWidget {
  const UserActionLog({super.key});

  @override
  State<UserActionLog> createState() => _UserActionLogState();
}

class _UserActionLogState extends State<UserActionLog> {
  String _searchData = '';
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;

  final List<Map<String, dynamic>> _allData = List.generate(
      100,
      (index) => {
            'Module': index + 1,
            'User Action': 'Item ${index + 1}',
            'User Operation': (index + 1) * 10,
            'Performed At': 'Item ${index + 1}',
            'Performed By': 'Item ${index + 1}',
          });

  List<Map<String, dynamic>> _filteredData = [];

  @override
  void initState() {
    _filteredData = List.from(_allData);
    super.initState();
  }

  void _filterData(String value) {
    setState(() {
      _searchData = value;
      if (_searchData.isEmpty) {
        _filteredData = List.from(_allData);
      } else {
        _filteredData = _allData
            .where((item) =>
                item['Module'].toString().contains(value) ||
                item['User Action']
                    .toString()
                    .toLowerCase()
                    .contains(value.toLowerCase()) ||
                item['Performed By']
                    .toString()
                    .toLowerCase()
                    .contains(value.toLowerCase()) ||
                item['Performed At']
                    .toString()
                    .toLowerCase()
                    .contains(value.toLowerCase()) ||
                item['User Operation']
                    .toString()
                    .toLowerCase()
                    .contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(context),
      drawer: const DrawerLeft(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Action Log',
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => const HomePage()),
                      child: const Text(
                        'Home',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      height: 15,
                      width: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const UserActionLog()),
                      child: const Text(
                        'User Action Log',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              PaginatedDataTable(
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Search :',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 35,
                      width: 150,
                      child: TextField(
                        onChanged: _filterData,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          prefixIcon: Icon(Icons.search),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                rowsPerPage: _rowsPerPage,
                availableRowsPerPage: const [10, 25, 50, 100],
                onRowsPerPageChanged: (value) {
                  setState(() {
                    _rowsPerPage = value!;
                  });
                },
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  DataColumn(
                    label: const Text('Module'),
                    onSort: (columnIndex, ascending) => setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                      if (ascending) {
                        _filteredData
                            .sort((a, b) => a['Module'].compareTo(b['Module']));
                      } else {
                        _filteredData
                            .sort((a, b) => b['Module'].compareTo(a['Module']));
                      }
                    }),
                  ),
                  DataColumn(
                    label: const Text('User Action'),
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                        if (ascending) {
                          _filteredData.sort((a, b) =>
                              a['User Action'].compareTo(b['User Action']));
                        } else {
                          _filteredData.sort((a, b) =>
                              b['User Action'].compareTo(a['User Action']));
                        }
                      });
                    },
                  ),
                  DataColumn(
                    label: const Text('User Operation'),
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                        if (ascending) {
                          _filteredData.sort((a, b) => a['User Operation']
                              .compareTo(b['User Operation']));
                        } else {
                          _filteredData.sort((a, b) => b['User Operation']
                              .compareTo(a['User Operation']));
                        }
                      });
                    },
                  ),
                  DataColumn(
                    label: const Text('Performed At'),
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                        if (ascending) {
                          _filteredData.sort((a, b) =>
                              a['Performed At'].compareTo(b['Performed At']));
                        } else {
                          _filteredData.sort((a, b) =>
                              b['Performed At'].compareTo(a['Performed At']));
                        }
                      });
                    },
                  ),
                  DataColumn(
                    label: const Text('Performed By'),
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                        if (ascending) {
                          _filteredData.sort((a, b) =>
                              a['Performed By'].compareTo(b['Performed By']));
                        } else {
                          _filteredData.sort((a, b) =>
                              b['Performed By'].compareTo(a['Performed By']));
                        }
                      });
                    },
                  ),
                ],
                source: _MyDataTableSource(_filteredData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;

  _MyDataTableSource(this._data);

  @override
  DataRow getRow(int index) {
    final rowData = _data[index];
    return DataRow(cells: [
      DataCell(Text(rowData['Module'].toString())),
      DataCell(Text(rowData['User Action'].toString())),
      DataCell(Text(rowData['User Operation'].toString())),
      DataCell(Text(rowData['Performed At'].toString())),
      DataCell(Text(rowData['Performed By'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
