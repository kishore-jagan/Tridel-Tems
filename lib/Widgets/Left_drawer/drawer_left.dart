import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../model/Drawerleft_model/drawerleft_model.dart';
import '../../view/DashBoard/dashboard.dart';
import '../../view/Reports/reports.dart';
import '../../view/Statistics/statistics.dart';
import '../../view/Homepage/homepage.dart';
import 'Widgets/imagepopup.dart';
import 'Widgets/notification.dart';

class DrawerLeft extends StatelessWidget {
  const DrawerLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              width: 90,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/Tridel-logo.png'),
                    fit: BoxFit.cover),
              ),
            ),
            const Text(
              'TEMS',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ImagePopUp(),
            const Text(
              'Admin',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 20,
              ),
            ),
            const Text(
              'ADMINISTRATOR',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const NotificationIcon(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  DrawerLeftModel(
                    ontap: () {
                      Get.to(() => const HomePage());
                    },
                    title: 'Home',
                    icon: SvgPicture.asset(
                      'assets/svg/home-outline.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  DrawerLeftModel(
                    ontap: () {
                      Get.to(() => const DashBoardPage());
                    },
                    title: 'Dashboard',
                    icon: SvgPicture.asset(
                      'assets/svg/dashboard.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                  DrawerLeftModel(
                    ontap: () {
                      Get.to(() => const ReportPage());
                    },
                    title: 'Reports',
                    icon: SvgPicture.asset(
                      'assets/svg/reports.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                  DrawerLeftModel(
                    ontap: () {
                      Get.to(() => const StatisticsPage());
                    },
                    title: 'Statistics',
                    icon: SvgPicture.asset(
                      'assets/svg/statistics.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                  DrawerLeftExpand1(
                    maintitle: 'Station Master',
                    icon: SvgPicture.asset(
                      'assets/svg/station_master.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                  DrawerLeftExpand2(
                    maintitle: 'Admin Center',
                    icon: SvgPicture.asset(
                      'assets/svg/admin_center.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
