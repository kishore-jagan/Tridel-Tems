import 'package:count_down_time/count_down_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Widgets/Appbar/appbar.dart';
import '../../../Widgets/Left_drawer/drawer_left.dart';
import '../../Homepage/homepage.dart';

class CommunicationCenterPage extends StatefulWidget {
  const CommunicationCenterPage({super.key});

  @override
  State<CommunicationCenterPage> createState() =>
      _CommunicationCenterPageState();
}

class _CommunicationCenterPageState extends State<CommunicationCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(context),
      drawer: const DrawerLeft(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Communication Center',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Get.to(const HomePage()),
                    child: const Text(
                      'Home',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 15,
                    width: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => const CommunicationCenterPage()),
                    child: const Text(
                      'Communication Center',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 3),
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 6.0,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/image/noimage.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'NCSCM_WQ1',
                                      style: TextStyle(fontSize: 14),
                                      softWrap: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'WQ1',
                                      style: TextStyle(fontSize: 12),
                                      softWrap: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'ONLINE',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString().substring(2)} '),
                                  Text(
                                      '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}'),
                                  const Text(
                                    'Last Updated',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: CircularPercentIndicator(
                                    radius: 25.0,
                                    lineWidth: 3.0,
                                    percent: 0.9,
                                    center: const Text('70%'),
                                    progressColor: Colors.lightBlue,
                                  ),
                                ),
                              ),
                              Builder(builder: (BuildContext context) {
                                return IconButton(
                                  icon: const Icon(
                                    Icons.more_vert_rounded,
                                  ),
                                  onPressed: () {
                                    final RenderBox renderBox =
                                        context.findRenderObject() as RenderBox;
                                    final Offset offset =
                                        renderBox.localToGlobal(Offset.zero);
                                    final RelativeRect position =
                                        RelativeRect.fromLTRB(
                                            offset.dx,
                                            offset.dy + renderBox.size.height,
                                            offset.dx + renderBox.size.width,
                                            offset.dy + renderBox.size.height);

                                    showMenu(
                                        color: Colors.white,
                                        context: context,
                                        position: position,
                                        items: [
                                          PopupMenuItem(
                                            child: ListTile(
                                              title: Center(
                                                child: CountDownTime.minutes(
                                                  onTimeOut: () {},
                                                  timeStartInMinutes: 5,
                                                  textStyle: const TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              subtitle: const SizedBox(
                                                width: 100,
                                                child: Center(
                                                  child: Text('Next Update'),
                                                ),
                                              ),
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                    border: Border.all(
                                                        color:
                                                            Colors.lightBlue)),
                                                child: const Icon(
                                                  Icons.messenger_outline_sharp,
                                                  color: Colors.lightBlue,
                                                  size: 20,
                                                ),
                                              ),
                                              // leading: Container(
                                              //   height: 40,
                                              //   width: 40,
                                              //   decoration: BoxDecoration(
                                              //       borderRadius:
                                              //           const BorderRadius.all(
                                              //         Radius.circular(10),
                                              //       ),
                                              //       border: Border.all(
                                              //           color: Colors.lightBlue)),
                                              //   child: const Icon(
                                              //     Icons.file_download_outlined,
                                              //     color: Colors.lightBlue,
                                              //   ),
                                              // ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            child: ListTile(
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                    border: Border.all(
                                                        color:
                                                            Colors.lightBlue)),
                                                child: const Icon(
                                                  Icons.file_download_outlined,
                                                  color: Colors.lightBlue,
                                                ),
                                              ),
                                              title: Container(
                                                  height: 30,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Colors.grey,
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '✓ Connect',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ]);
                                  },
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
