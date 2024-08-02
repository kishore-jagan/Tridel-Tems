import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../view/Admin_Center/Notification_Settings/notification_settings.dart';
import '../../view/Admin_Center/User_Action_Log/user_action_log.dart';
import '../../view/Admin_Center/User_Management/settings.dart';
import '../../view/Station_Master/Communication_Center/communication_center.dart';
import '../../view/Station_Master/Configurations/configuration.dart';
import '../../view/Station_Master/Data_Management/data_management.dart';
import '../../view/Station_Master/Maintenance_Manager/Maintenance_Dashboard/maintenance_dashboard.dart';
import '../../view/Station_Master/Maintenance_Manager/Maintenance_Settings/maintenance_settings.dart';
import '../../view/Station_Master/Station_Management/station_management.dart';

// ignore: must_be_immutable
class DrawerLeftModel extends StatelessWidget {
  String title;
  SvgPicture icon;
  VoidCallback ontap;

  DrawerLeftModel(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: ontap,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        leading: icon);
  }
}

// ignore: must_be_immutable
class DrawerLeftExpand1 extends StatelessWidget {
  String maintitle;
  SvgPicture icon;

  DrawerLeftExpand1({
    super.key,
    required this.maintitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.blue,
      child: ExpansionTile(
        // iconColor: Colors.white,
        childrenPadding: EdgeInsets.zero,
        title: Text(
          maintitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: icon,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
            ),
            child: ListTile(
              onTap: () => Get.to(() => const CommunicationCenterPage()),
              title: const Text(
                'Communication Center',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/svg/communication_center.svg',
                // ignore: deprecated_member_use
                color: Colors.white, // Use the color property from SvgPicture
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
            ),
            child: ListTile(
              onTap: () => Get.to(() => const StationManagementPage()),
              title: const Text(
                'Station Management',
                style: TextStyle(color: Colors.white),
              ),
              leading: SvgPicture.asset(
                'assets/svg/station_management.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
            ),
            child: ListTile(
              onTap: () {
                Get.to(() => const ConfigurationsPage());
              },
              title: const Text(
                'Configuration',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/svg/configurations.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
            ),
            child: ListTile(
              onTap: () => Get.to(() => const DataManagementPage()),
              title: const Text(
                'Data Management',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/svg/data_management.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 22.0,
              ),
              child: MaintenanceManagerExpand(
                  mainTitle: 'Maintenance Manager',
                  icon: SvgPicture.asset(
                    'assets/svg/maintenance_manager.svg',
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MaintenanceManagerExpand extends StatelessWidget {
  String mainTitle;
  SvgPicture icon;

  MaintenanceManagerExpand({
    super.key,
    required this.mainTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      margin: EdgeInsets.all(10.0),
      color: Colors.blue,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        title: Text(
          mainTitle,
          style: const TextStyle(color: Colors.white),
        ),
        leading: icon,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: ListTile(
              onTap: () => Get.to(() => const MaintenanceSettingsPage()),
              title: const Text(
                'Maintenance Settings',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/svg/maintenance_settings.svg',
                // ignore: deprecated_member_use
                color: Colors.white, // Use the color property from SvgPicture
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
            ),
            child: ListTile(
              onTap: () => Get.to(() => const MaintenanceDashboardPage()),
              title: const Text(
                'Maintenance Dashboard',
                style: TextStyle(color: Colors.white),
              ),
              leading: SvgPicture.asset(
                'assets/svg/maintenance_dashboard.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DrawerLeftExpand2 extends StatelessWidget {
  String maintitle;
  SvgPicture icon;

  DrawerLeftExpand2({
    super.key,
    required this.maintitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.blue,
      child: ExpansionTile(
        iconColor: Colors.white,
        childrenPadding: EdgeInsets.zero,
        title: Text(
          maintitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: icon,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
            ),
            child: ListTile(
              onTap: () => Get.to(() => const Settings()),
              title: const Text(
                'User Management',
                style: TextStyle(color: Colors.white),
              ),
              leading: SvgPicture.asset(
                'assets/svg/user_management.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
            ),
            child: ListTile(
              onTap: () => Get.to(() => const NotificationSettingsPage()),
              title: const Text(
                'Notification Settings',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: SvgPicture.asset(
                'assets/svg/notification_settings.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
            ),
            child: ListTile(
              onTap: () => Get.to(() => const UserActionLog()),
              title: const Text(
                'User Action Log',
                style: TextStyle(color: Colors.white),
              ),
              leading: SvgPicture.asset(
                'assets/svg/user_action_log.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
