import 'package:flutter/material.dart';

import '../Widgets/stationmanagement_drop.dart';

class StationMetaDetails extends StatefulWidget {
  const StationMetaDetails({super.key});

  @override
  State<StationMetaDetails> createState() => _StationMetaDetailsState();
}

class _StationMetaDetailsState extends State<StationMetaDetails> {
  String _stationSelected = 'WQ 1';
  final List<String> _stationList = ['WQ 1', 'WQ 2'];

  final List<Map<String, dynamic>> _data = List.generate(
    4,
    (index) => {
      'Name': 'Item $index',
      'Serial Number': '',
      'Brand': '',
      'Installation Date': DateTime.now(),
      'Warranty (Months)': ''
    },
  );

  void _updateData(Map<String, dynamic> newData) {
    setState(() {
      final index = _data.indexWhere((item) => item['Name'] == newData['Name']);
      if (index != -1) {
        _data[index] = newData;
      }
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
                'Station*',
                style: TextStyle(fontSize: 18.0),
              ),
              StationManagementDrop(
                  val: _stationSelected,
                  items: _stationList,
                  onChanged: (newValue) {
                    setState(() {
                      _stationSelected = newValue!;
                    });
                  }),
              const SizedBox(
                height: 20.0,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              PaginatedDataTable(
                onPageChanged: (newRowsPerPage) {
                  setState(() {});
                },
                rowsPerPage: 7,
                // availableRowsPerPage: const [7, 10, 15],
                columnSpacing: 20,
                horizontalMargin: 10,
                columns: const [
                  DataColumn(
                    label: Text('Name'),
                  ),
                  DataColumn(
                    label: SizedBox(
                        width: 100,
                        child: Text(
                          'Serial Number',
                          softWrap: true,
                        )),
                  ),
                  DataColumn(
                    label: Text('Brand'),
                  ),
                  DataColumn(
                    label: SizedBox(
                        width: 150,
                        child: Text(
                          'Installation Date',
                          softWrap: true,
                        )),
                  ),
                  DataColumn(
                    label: Text('Warranty (Months)'),
                  ),
                ],
                source: _DataSource(context, _data, _updateData),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final BuildContext _context;
  final List<Map<String, dynamic>> _data;
  final Function(Map<String, dynamic>) _updateDataCallback;

  _DataSource(this._context, this._data, this._updateDataCallback);

  @override
  DataRow getRow(int index) {
    final rowData = _data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Container(
            height: 40,
            width: 60,
            color: Colors.lightBlue,
            child: Center(child: Text(rowData['Name'])))),
        DataCell(Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            height: 40,
            width: 150,
            child: TextField(
              maxLines: 1,
              onChanged: (value) {
                rowData['Serial Number'] = value;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Enter serial number',
              ),
            ),
          ),
        )),
        DataCell(SizedBox(
          height: 40,
          width: 150,
          child: TextField(
            onChanged: (value) {
              rowData['Brand'] = value;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              hintText: 'Enter brand',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        )),
        DataCell(
          TextButton(
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: _context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                _updateDataCallback(
                    {...rowData, 'Installation Date': pickedDate});
              }
            },
            child: Text(rowData['Installation Date'].toString()),
          ),
        ),
        DataCell(SizedBox(
          height: 40,
          width: 150,
          child: TextField(
            onChanged: (value) {
              rowData['Warranty (Months)'] = value;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              hintText: 'Enter warranty (months)',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        )),
      ],
    );
  }

  @override
  int get rowCount => _data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
