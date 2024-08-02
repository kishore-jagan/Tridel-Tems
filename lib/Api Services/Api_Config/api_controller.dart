import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../model/Statistics/linechart_model.dart';
import 'apiData.dart';
import 'api_config.dart';

class ApiController extends GetxController {
  void setKey(Map<String, dynamic> data) {
    ApiConfig.bearerToken = '${ApiConfig.bearerType} ${data['token']}';
    ApiConfig.refreshToken = data['refreshToken'];

    update();
  }

  void locationLatLng(List<LatLng> data) {
    ApiData.routepoints = data;
  }

  void chartDataSet(List<ChartDataModel> data) {
    ApiData.chartData = data;
    update();
  }
}



//