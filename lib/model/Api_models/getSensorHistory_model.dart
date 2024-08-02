class SensorHistory {
  final int stationId;
  final String stationName;
  final String stationCode;
  final double latitude;
  final double longitude;
  final String locationDetails;
  final List<RSensorss> sensors;

  SensorHistory({
    required this.stationId,
    required this.stationName,
    required this.stationCode,
    required this.latitude,
    required this.longitude,
    required this.locationDetails,
    required this.sensors,
  });

  factory SensorHistory.fromJson(Map<String, dynamic> json) {
    List<dynamic> sensorsData = json['sensors'] ?? [];
    List<RSensorss> sensors =
        sensorsData.map((item) => RSensorss.fromJson(item)).toList();

    return SensorHistory(
      stationId: json['stationId'],
      stationName: json['stationName'],
      stationCode: json['stationCode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      locationDetails: json['locationDetails'],
      sensors: sensors,
    );
  }
}

class RSensorss {
  final int sensorId;
  final String sensorName;
  final String sensorCode;
  final List<RSensorParameters> sensorParams;

  RSensorss({
    required this.sensorId,
    required this.sensorName,
    required this.sensorCode,
    required this.sensorParams,
  });

  factory RSensorss.fromJson(Map<String, dynamic> json) {
    List<dynamic> paramsData = json['sensorParams'] ?? [];
    List<RSensorParameters> params =
        paramsData.map((item) => RSensorParameters.fromJson(item)).toList();

    return RSensorss(
      sensorId: json['sensorId'],
      sensorName: json['sensorName'],
      sensorCode: json['sensorCode'],
      sensorParams: params,
    );
  }
}

class RSensorParameters {
  final int paramId;
  final String paramName;
  final String unit;
  final double warn;
  final double danger;
  final double min;
  final double max;
  final String data;
  final String date;
  final String time;

  RSensorParameters({
    required this.paramId,
    required this.paramName,
    required this.unit,
    required this.warn,
    required this.danger,
    required this.min,
    required this.max,
    required this.data,
    required this.date,
    required this.time,
  });

  factory RSensorParameters.fromJson(Map<String, dynamic> json) {
    return RSensorParameters(
      paramId: json['paramId'],
      paramName: json['paramName'],
      unit: json['unit'],
      warn: json['warn'],
      danger: json['danger'],
      min: json['min'],
      max: json['max'],
      data: json['data'],
      date: json['date'],
      time: json['time'],
    );
  }
}
