import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../Style/toast.dart';
import 'Api_Config/api_config.dart';

class LogoutService {
  Future<void> logout() async {
    try {
      var response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/api/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': ApiConfig.bearerToken,
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Navigate to Settings screen
        Get.toNamed('/auth');

        // Show success message
        toaster().showsToast(data['message'], Colors.green, Colors.white);
      } else {
        print('Logout Error: ${response.statusCode}');
        // Show error message
        toaster().showsToast('Logout failed', Colors.red, Colors.white);
      }
    } catch (e) {
      print('Logout Error: $e');
      // Show generic error message
      toaster().showsToast(
          'An error occurred during logout', Colors.red, Colors.white);
    }
  }
}
