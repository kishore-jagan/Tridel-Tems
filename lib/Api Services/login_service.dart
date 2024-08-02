import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Style/toast.dart';
import 'Api_Config/api_config.dart';
import 'Api_Config/api_controller.dart';
import 'getStationSensors_Ids_service.dart';

class LoginService {
  Future<void> login(String username, String password) async {
    Map<String, dynamic> credentials = {
      'username': username,
      'password': password,
    };
    String json = jsonEncode(credentials);
    try {
      var response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}${ApiConfig.loginUrl}'),
        headers: {'Content-Type': 'application/json'},
        body: json,
      );
      print(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        // print('Login Successful');
        toaster().showsToast('Login Successful', Colors.green, Colors.white);
        ApiController().setKey(data);

        await GetSensorsByStationIdsService().getAllSensorsByStation();
        Get.toNamed('/home');
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print('Unauthorized: Invalid Credentials');
        toaster().showsToast(data['message'], Colors.red, Colors.white);
      } else {
        print('Error: ${response.statusCode}');
        toaster().showsToast('An error Occured', Colors.red, Colors.white);
      }
    } catch (e) {
      print('Error: $e');
      toaster().showsToast('An error Occured', Colors.red, Colors.white);
    }
  }
}
