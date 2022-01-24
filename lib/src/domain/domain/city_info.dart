import 'package:equatable/equatable.dart';

class CityInfo extends Equatable{
  final String? name;
  final String? country;
  final String? latitude;
  final String? longitude;
  final String? elevation;
  final String? sunrise;
  final String? sunset;

  const CityInfo({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.sunrise,
    required this.sunset,
  });

  // factory CityInfo.fromJson(Map<String, dynamic> json) => CityInfo(
  //   name: json["name"] == null ? null : json["name"],
  //   country: json["country"] == null ? null : json["country"],
  //   latitude: json["latitude"] == null ? null : json["latitude"],
  //   longitude: json["longitude"] == null ? null : json["longitude"],
  //   elevation: json["elevation"] == null ? null : json["elevation"],
  //   sunrise: json["sunrise"] == null ? null : json["sunrise"],
  //   sunset: json["sunset"] == null ? null : json["sunset"],
  // );

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