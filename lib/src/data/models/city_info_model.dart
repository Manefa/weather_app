import 'package:weather_app/src/domain/domain/city_info.dart';

class CityInfoModel extends CityInfo{
  const CityInfoModel({
    required String? name,
    required String? country,
    required String? latitude,
    required String? longitude,
    required String? elevation,
    required String? sunrise,
    required String? sunset,
  }) : super(
    name: name,
    country: country,
    latitude: latitude,
    longitude: longitude,
    elevation: elevation,
    sunrise: sunrise,
    sunset: sunrise,
  );

  factory CityInfoModel.fromJson(Map<String, dynamic> json) => CityInfoModel(
    name: json["name"] == null ? null : json["name"],
    country: json["country"] == null ? null : json["country"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    elevation: json["elevation"] == null ? null : json["elevation"],
    sunrise: json["sunrise"] == null ? null : json["sunrise"],
    sunset: json["sunset"] == null ? null : json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "country": country == null ? null : country,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "elevation": elevation == null ? null : elevation,
    "sunrise": sunrise == null ? null : sunrise,
    "sunset": sunset == null ? null : sunset,
  };

  @override
  List<Object?> get props => [name, country, latitude, longitude, elevation, sunrise, sunset];
}