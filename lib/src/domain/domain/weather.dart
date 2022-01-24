import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/domain/city_info.dart';
import 'package:weather_app/src/domain/domain/current_condition.dart';
import 'package:weather_app/src/domain/domain/fcst_day.dart';
import 'package:weather_app/src/domain/domain/fore_cast_info.dart';

class Weather extends Equatable{
  final CityInfo? cityInfo;
  final ForecastInfo? forecastInfo;
  final CurrentCondition? currentCondition;
  final FcstDay? fcstDay0;
  final FcstDay? fcstDay1;
  final FcstDay? fcstDay2;
  final FcstDay? fcstDay3;
  final FcstDay? fcstDay4;

  const Weather({
    required this.cityInfo,
    required this.forecastInfo,
    required this.currentCondition,
    required this.fcstDay0,
    required this.fcstDay1,
    required this.fcstDay2,
    required this.fcstDay3,
    required this.fcstDay4,
  });

  // factory Weather.fromJson(Map<String, dynamic> json) => Weather(
  //   cityInfo: json["city_info"] == null ? null : CityInfo.fromJson(json["city_info"]),
  //   forecastInfo: json["forecast_info"] == null ? null : ForecastInfo.fromJson(json["forecast_info"]),
  //   currentCondition: json["current_condition"] == null ? null : CurrentCondition.fromJson(json["current_condition"]),
  //   fcstDay0: json["fcst_day_0"] == null ? null : FcstDay.fromJson(json["fcst_day_0"]),
  //   fcstDay1: json["fcst_day_1"] == null ? null : FcstDay.fromJson(json["fcst_day_1"]),
  //   fcstDay2: json["fcst_day_2"] == null ? null : FcstDay.fromJson(json["fcst_day_2"]),
  //   fcstDay3: json["fcst_day_3"] == null ? null : FcstDay.fromJson(json["fcst_day_3"]),
  //   fcstDay4: json["fcst_day_4"] == null ? null : FcstDay.fromJson(json["fcst_day_4"]),
  // );

  Map<String, dynamic> toJson() => {
    "city_info": cityInfo == null ? null : cityInfo!.toJson(),
    "forecast_info": forecastInfo == null ? null : forecastInfo!.toJson(),
    "current_condition": currentCondition == null ? null : currentCondition!.toJson(),
    "fcst_day_0": fcstDay0 == null ? null : fcstDay0!.toJson(),
    "fcst_day_1": fcstDay1 == null ? null : fcstDay1!.toJson(),
    "fcst_day_2": fcstDay2 == null ? null : fcstDay2!.toJson(),
    "fcst_day_3": fcstDay3 == null ? null : fcstDay3!.toJson(),
    "fcst_day_4": fcstDay4 == null ? null : fcstDay4!.toJson(),
  };

  @override
  List<Object?> get props => [cityInfo, forecastInfo, currentCondition, fcstDay0, fcstDay1, fcstDay2, fcstDay3, fcstDay4];
}