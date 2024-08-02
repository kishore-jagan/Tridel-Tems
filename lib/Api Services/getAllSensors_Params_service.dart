import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Style/toast.dart';
import '../model/Api_models/getAllSensors_Params_model.dart';
import 'Api_Config/api_config.dart';

class GetAllSensorsService {
  Future<List<Sensor>> getAllSensors() async {
    try {
      var response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/api/sensors/all'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': ApiConfig.bearerToken,
          'apiKey': ApiConfig.apiKey,
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['sensors'];
        List<Sensor> sensors =
            jsonResponse.map((data) => Sensor.fromJson(data)).toList();

        return sensors;
      } else {
        print('Get All Stations Error: ${response.statusCode}');

        toaster()
            .showsToast('Failed to fetch stations', Colors.red, Colors.white);
        return [];
      }
    } catch (e) {
      print('Get All Stations Error: $e');

      toaster().showsToast('An error occurred while fetching stations',
          Colors.red, Colors.white);
      return [];
    }
  }
}
