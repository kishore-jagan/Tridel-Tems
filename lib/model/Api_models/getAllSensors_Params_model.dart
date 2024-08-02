class Sensor {
  final int sensorId;
  final String sensorName;
  final String sensorCode;
  final List<SensorParam> sensorParams;

  Sensor({
    required this.sensorId,
    required this.sensorName,
    required this.sensorCode,
    required this.sensorParams,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      sensorId: json['sensorId'],
      sensorName: json['sensorName'],
      sensorCode: json['sensorCode'],
      sensorParams: (json['sensorParams'] as List)
          .map((param) => SensorParam.fromJson(param))
          .toList(),
    );
  }
}

class SensorParam {
  final int sensorParamId;
  final bool dashFlag;
  final String parameterName;

  SensorParam({
    required this.sensorParamId,
    required this.dashFlag,
    required this.parameterName,
  });

  factory SensorParam.fromJson(Map<String, dynamic> json) {
    return SensorParam(
      sensorParamId: json['sensorParamId'],
      dashFlag: json['dashFlag'],
      parameterName: json['parameterName'],
    );
  }
}
