import 'package:weather_app/src/domain/domain/fore_cast_info.dart';

class ForecastInfoModel extends ForecastInfo{
  ForecastInfoModel({
    required double? latitude,
    required double? longitude,
    required String? elevation,
  }) : super(
    latitude: latitude,
    longitude: longitude,
    elevation: elevation,
  );

  factory ForecastInfoModel.fromJson(Map<String, dynamic> json) => ForecastInfoModel(
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
  List<Object?> get props => [];
}