import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/string.dart';
import '../../Widgets/Right_drawer/dashboard_drawer.dart';
import '../../Widgets/Right_drawer/dataqa_filter_drawer.dart';
import '../../Widgets/Right_drawer/dataqa_upload_drawer.dart';
import '../../Widgets/Right_drawer/dataupload_download_drawer.dart';
import '../../Widgets/Right_drawer/dataupload_upload_drawer.dart';
import '../../Widgets/Right_drawer/drawer_right.dart';
import '../../Widgets/Right_drawer/report_drawer.dart';
import '../../Widgets/Right_drawer/statistics_drawer.dart';

class EndDrawerSelection extends StatefulWidget {
  const EndDrawerSelection({super.key});

  @override
  State<EndDrawerSelection> createState() => _EndDrawerSelectionState();
}

class _EndDrawerSelectionState extends State<EndDrawerSelection> {
  final MainDrawerString _drawer = Get.put(MainDrawerString());
  @override
  Widget build(BuildContext context) {
    if (_drawer.drawerValue == 'main') {
      return const DrawerRight();
    } else if (_drawer.drawerValue == 'dashboardfilter') {
      return const DashboardFilterDrawer();
    } else if (_drawer.drawerValue == 'reportfilter') {
      return const ReportFilterDrawer();
    } else if (_drawer.drawerValue == 'statisticsfilter') {
      return const StatisticsFilterDrawer();
    } else if (_drawer.drawerValue == 'qauploadfilter') {
      return const DataQaUploadDrawer();
    } else if (_drawer.drawerValue == 'qafilter') {
      return const DataQaFilterDrawer();
    } else if (_drawer.drawerValue == 'uploadfilter') {
      return const DataUploadDrawer();
    } else if (_drawer.drawerValue == 'downloadfilter') {
      return const DataDownloadDrawer();
    }
    return Container();
  }
}
