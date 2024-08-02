import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/Api_models/getSensorHistory_model.dart';
import 'Api_Config/api_config.dart';

class GetSensorHistoryByStationId {
  final String baseURL = "https://tems.tridelespecia.com";
  final String apiKey = "JyAaLfpOMxa6mi8NgmtqXrNfbIMXR2yRyVzxji7Oo54=";

  Future<List<SensorHistory>> getSensorsHistory(
      List<int> stationIds, DateTime fromDate, DateTime toDate) async {
    // Construct the request URL
    Uri uri = Uri.parse('$baseURL/api/sensors/history/by-station-ids');
    uri = uri.replace(queryParameters: {
      'stationIds': stationIds.join(','),
      'fromDate': fromDate,
      'toDate': toDate,
    });

    // Make the request
    http.Response response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ApiConfig.bearerToken,
        'apiKey': ApiConfig.apiKey,
      },
    );
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    // Parse the response
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> data = json.decode(response.body)['stationDetails'];
      return data.map((item) => SensorHistory.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
