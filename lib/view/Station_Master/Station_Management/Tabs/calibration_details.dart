import 'package:flutter/material.dart';

import '../Widgets/stationmanagement_drop.dart';

class CalibrationDetails extends StatefulWidget {
  const CalibrationDetails({super.key});

  @override
  State<CalibrationDetails> createState() => _CalibrationDetailsState();
}

class _CalibrationDetailsState extends State<CalibrationDetails> {
  final TextEditingController _remarks = TextEditingController();

  String _stationSelected = 'WQ 1';
  String _sensorSelected = 'WATER QUALITY';
  String _calibrationSelected = 'Factory';
  DateTime? _dateTimeSelected;
  String _statusSelected = 'Pass';

  String? pickedDate;

  TextEditingController datecontroller = TextEditingController();

  final List<String> _stationList = ['WQ 1', 'WQ 2'];
  final List<String> _calibrationList = ['Factory', 'Onsite'];
  final List<String> _sensorList = [
    'WATER QUALITY',
    'DATA LOGGER',
    'MODEM',
    'DATA BUOY'
  ];
  final List<String> _statusList = ['Pass', 'Fail'];

  List<String> sensorName = [];
  List<String> calitype = [];
  List<String> calidate = [];
  List<String> calistatus = [];
  List<String> caliremarks = [];

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTimeSelected ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        // ignore: use_build_context_synchronously
        context: context,
        initialTime:
            TimeOfDay.fromDateTime(_dateTimeSelected ?? DateTime.now()),
      );
      if (pickedTime != null) {
        setState(() {
          _dateTimeSelected = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          datecontroller.text = _dateTimeSelected!.toString();
        });
      }
    }
  }

  void editRow(int index) {
    setState(() {
      // Update controllers and selected values with the values of the selected row
      _sensorSelected = sensorName[index];
      _calibrationSelected = calitype[index];
      datecontroller.text = calidate[index];
      _statusSelected = calistatus[index];
      _remarks.text = caliremarks[index];
    });
  }

  void clearFields() {
    setState(() {
      _stationSelected = 'WQ 1';
      _calibrationSelected = 'Factory';
      _sensorSelected = 'WATER QUALITY';
      _dateTimeSelected = null;
      _statusSelected = 'Pass';
      _remarks.text = '';
      datecontroller.clear();
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
                  'Calibration Details',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(
                    'Station*',
                    style: TextStyle(fontSize: 16.0),
                  ),
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
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(
                    'Sensor Name*',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                StationManagementDrop(
                    val: _sensorSelected,
                    items: _sensorList,
                    onChanged: (newValue) {
                      setState(() {
                        _sensorSelected = newValue!;
                      });
                    }),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(
                    'Calibration Type*',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                StationManagementDrop(
                    val: _calibrationSelected,
                    items: _calibrationList,
                    onChanged: (newValue) {
                      setState(() {
                        _calibrationSelected = newValue!;
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Calibration Date*'),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: datecontroller,
                        decoration: InputDecoration(
                          // labelText: 'Select Date and Time',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () => _selectDateTime(context),
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(
                    'Status*',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                StationManagementDrop(
                    val: _statusSelected,
                    items: _statusList,
                    onChanged: (newValue) {
                      setState(() {
                        _statusSelected = newValue!;
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(
                    'Remarks*',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                TextField(
                  controller: _remarks,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    // hintText: widget.val,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.2),
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.5))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.lightBlue),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (sensorName.isEmpty) {
                            // If no items have been added yet, add a new entry
                            sensorName.add(_sensorSelected);
                            calitype.add(_calibrationSelected);
                            calidate.add(_dateTimeSelected.toString());
                            calistatus.add(_statusSelected);
                            caliremarks.add(_remarks.text);
                          } else {
                            // Otherwise, overwrite the last added values with the current selections
                            int lastIndex = sensorName.length - 1;
                            sensorName[lastIndex] = _sensorSelected;
                            calitype[lastIndex] = _calibrationSelected;
                            calidate[lastIndex] = _dateTimeSelected.toString();
                            calistatus[lastIndex] = _statusSelected;
                            caliremarks[lastIndex] = _remarks.text;
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
                    const SizedBox(
                      width: 7,
                    ),
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
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      'Station : ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$_stationSelected',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columnSpacing: 10,
                        columns: const [
                          DataColumn(
                              label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Sensor Name',
                                    softWrap: true,
                                  ))),
                          DataColumn(
                              label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Calibration type',
                                    softWrap: true,
                                  ))),
                          DataColumn(
                              label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Calibration date',
                                    softWrap: true,
                                  ))),
                          DataColumn(
                              label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'status',
                                    softWrap: true,
                                  ))),
                          DataColumn(
                              label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'remark',
                                    softWrap: true,
                                  ))),
                          DataColumn(
                              label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'action',
                                    softWrap: true,
                                  ))),
                        ],
                        rows: List.generate(sensorName.length, (index) {
                          return DataRow(cells: [
                            DataCell(Text(sensorName[index])),
                            DataCell(Center(child: Text(calitype[index]))),
                            DataCell(Center(child: Text(calidate[index]))),
                            DataCell(Center(child: Text(calistatus[index]))),
                            DataCell(Center(child: Text(caliremarks[index]))),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    editRow(index);
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ],
                            )),
                          ]);
                        })),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
