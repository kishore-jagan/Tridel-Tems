class StationSensors {
  final int stationId;
  final String stationName;
  final String stationCode;
  final double latitude;
  final double longitude;
  final String? stationImg;
  final bool mobilityFlag;
  final String? stationStatus;
  final String locationDetails;
  final List<Sensorss> sensors;

  StationSensors({
    required this.stationId,
    required this.stationName,
    required this.stationCode,
    required this.latitude,
    required this.longitude,
    this.stationImg,
    required this.mobilityFlag,
    this.stationStatus,
    required this.locationDetails,
    required this.sensors,
  });

  factory StationSensors.fromJson(Map<String, dynamic> json) {
    return StationSensors(
      stationId: json['stationId'],
      stationName: json['stationName'],
      stationCode: json['stationCode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      stationImg: json['stationImg'],
      mobilityFlag: json['mobilityFlag'],
      stationStatus: json['stationStatus'],
      locationDetails: json['locationDetails'],
      sensors: (json['sensors'] as List)
          .map((sensorJson) => Sensorss.fromJson(sensorJson))
          .toList(),
    );
  }
}

class Sensorss {
  final int sensorId;
  final String sensorName;
  final String sensorCode;
  final List<SensorParamss> sensorParams;

  Sensorss({
    required this.sensorId,
    required this.sensorName,
    required this.sensorCode,
    required this.sensorParams,
  });

  factory Sensorss.fromJson(Map<String, dynamic> json) {
    return Sensorss(
      sensorId: json['sensorId'],
      sensorName: json['sensorName'],
      sensorCode: json['sensorCode'],
      sensorParams: (json['sensorParams'] as List)
          .map((paramJson) => SensorParamss.fromJson(paramJson))
          .toList(),
    );
  }
}

class SensorParamss {
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

  SensorParamss({
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

  factory SensorParamss.fromJson(Map<String, dynamic> json) {
    return SensorParamss(
      paramId: json['paramId'],
      paramName: json['paramName'],
      unit: json['unit'],
      warn: json['warn'].toDouble(),
      danger: json['danger'].toDouble(),
      min: json['min'].toDouble(),
      max: json['max'].toDouble(),
      data: json['data'],
      date: json['date'],
      time: json['time'],
    );
  }
}
