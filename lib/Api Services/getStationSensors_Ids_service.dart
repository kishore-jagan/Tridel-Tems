import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../Style/toast.dart';
import '../model/Api_models/getStationSensors_IDs_model.dart';
import 'Api_Config/api_config.dart';
import 'Api_Config/api_controller.dart';

class GetSensorsByStationIdsService {
  Future<void> getAllSensorsByStation() async {
    try {
      var response = await http.get(
          Uri.parse('${ApiConfig.baseUrl}/api/sensors/by-station-ids'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': ApiConfig.bearerToken,
            'apiKey': ApiConfig.apiKey,
          });

      print(response.body);
      if (response.statusCode == 200) {
        List<LatLng> routepoints = [];

        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<StationSensors> stationSensor =
            (jsonResponse['stationDetails'] as List)
                .map((data) => StationSensors.fromJson(data))
                .toList();
        print('sdassdasdadsasda');

        for (var stationSensor in stationSensor) {
          routepoints
              .add(LatLng(stationSensor.latitude, stationSensor.longitude));
          ApiController().locationLatLng(routepoints);
        }
      } else {
        print('Get All Stations Error: ${response.statusCode}');

        toaster()
            .showsToast('Failed to fetch stations', Colors.red, Colors.white);
      }
    } catch (e) {
      print('Get All Stations Error: $e');

      toaster().showsToast('An error occurred while fetching stations',
          Colors.red, Colors.white);
    }
  }
}
