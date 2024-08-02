import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MaintenanceCycle extends StatefulWidget {
  const MaintenanceCycle({super.key});

  @override
  State<MaintenanceCycle> createState() => _MaintenanceCycleState();
}

class _MaintenanceCycleState extends State<MaintenanceCycle> {
  String _selectedItem = 'Preventive Maintenance';

  List<dynamic> maintenanceDashboardValue = [
    {
      'icon': 'assets/svg/total_stations.svg',
      'text': 'Total Stations',
    },
    {
      'icon': 'assets/svg/total_cycles.svg',
      'text': 'Total Cycles',
    },
    {
      'icon': 'assets/svg/pm_completed.svg',
      'text': 'PM Completed',
    },
    {
      'icon': 'assets/svg/cm_requests.svg',
      'text': 'CM Requets',
    },
    {
      'icon': 'assets/svg/cm_completed.svg',
      'text': 'CM Completed',
    },
    {
      'icon': 'assets/svg/cm_requests.svg',
      'text': 'CM Requets',
    },
    {
      'icon': 'assets/svg/cm_completed.svg',
      'text': 'CM Completed',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6.0),
          ]),
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 300,

              // height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: GridView.builder(
                itemCount: maintenanceDashboardValue.length,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 40),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 1),
                          blurRadius: 15,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: SvgPicture.asset(
                                '${maintenanceDashboardValue[index]['icon']}',
                                // ignore: deprecated_member_use
                                color: Colors.white,
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          maintenanceDashboardValue[index]['text'].toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Project Process",
                  style: TextStyle(color: Colors.lightBlue, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        height: 30,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Completed',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Planned',
                            style: TextStyle(color: Colors.amber, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Overdue',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 40,
                        width: 240,
                        child: DropdownButtonFormField<String>(
                          value: _selectedItem,
                          items: <String>[
                            'Preventive Maintenance',
                            'Corrective Maintenance'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 240,
                      child: DropdownButtonFormField<String>(
                        value: _selectedItem,
                        items: <String>[
                          'Preventive Maintenance',
                          'Corrective Maintenance'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedItem = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
