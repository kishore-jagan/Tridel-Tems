import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../model/Statistics/linechart_model.dart';

class ApiData extends GetxController {
  static List<LatLng> routepoints = [];
  static String stationId = '';
  static String fromDate = '';
  static String toDate = '';
  static List<ChartDataModel> chartData = [];
}
