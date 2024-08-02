class Station {
  final int stationId;
  final String stationName;
  final String stationCode;
  final StationType stationType;

  Station({
    required this.stationId,
    required this.stationName,
    required this.stationCode,
    required this.stationType,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationId: json['stationId'],
      stationName: json['stationName'],
      stationCode: json['stationCode'],
      stationType: StationType.fromJson(json['stationType']),
    );
  }
}

class StationType {
  final int stationTypeId;
  final String stationTypeName;
  final String stationTypeCode;

  StationType({
    required this.stationTypeId,
    required this.stationTypeName,
    required this.stationTypeCode,
  });

  factory StationType.fromJson(Map<String, dynamic> json) {
    return StationType(
      stationTypeId: json['stationTypeId'],
      stationTypeName: json['stationTypeName'],
      stationTypeCode: json['stationTypeCode'],
    );
  }
}
