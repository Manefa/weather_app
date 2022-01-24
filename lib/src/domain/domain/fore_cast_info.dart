import 'package:equatable/equatable.dart';

class ForecastInfo extends Equatable{
  ForecastInfo({
    required this.latitude,
    required this.longitude,
    required this.elevation,
  });

  final double? latitude;
  final double? longitude;
  final String? elevation;

  factory ForecastInfo.fromJson(Map<String, dynamic> json) => ForecastInfo(
    latitude: json["latitude"],
    longitude: json["longitude"],
    elevation: json["elevation"] == null ? null : json["elevation"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "elevation": elevation == null ? null : elevation,
  };

  @override
  List<Object?> get props => [latitude, longitude, elevation];
}