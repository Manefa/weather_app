import 'package:weather_app/src/data/models/city_info_model.dart';
import 'package:weather_app/src/data/models/current_condition_model.dart';
import 'package:weather_app/src/data/models/fcst_day_model.dart';
import 'package:weather_app/src/data/models/fore_cast_info_model.dart';
import 'package:weather_app/src/domain/domain/weather.dart';

class WeatherModel extends Weather{
  const WeatherModel({
    required CityInfoModel? cityInfo,
    required ForecastInfoModel? forecastInfo,
    required CurrentConditionModel? currentCondition,
    required FcstDayModel? fcstDay0,
    required FcstDayModel? fcstDay1,
    required FcstDayModel? fcstDay2,
    required FcstDayModel? fcstDay3,
    required FcstDayModel? fcstDay4,
  }) : super(
    cityInfo: cityInfo,
    forecastInfo: forecastInfo,
    currentCondition: currentCondition,
    fcstDay0: fcstDay0,
    fcstDay1: fcstDay1,
    fcstDay2: fcstDay2,
    fcstDay3: fcstDay3,
    fcstDay4: fcstDay4,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    cityInfo: json["city_info"] == null ? null : CityInfoModel.fromJson(json["city_info"]),
    forecastInfo: json["forecast_info"] == null ? null : ForecastInfoModel.fromJson(json["forecast_info"]),
    currentCondition: json["current_condition"] == null ? null : CurrentConditionModel.fromJson(json["current_condition"]),
    fcstDay0: json["fcst_day_0"] == null ? null : FcstDayModel.fromJson(json["fcst_day_0"]),
    fcstDay1: json["fcst_day_1"] == null ? null : FcstDayModel.fromJson(json["fcst_day_1"]),
    fcstDay2: json["fcst_day_2"] == null ? null : FcstDayModel.fromJson(json["fcst_day_2"]),
    fcstDay3: json["fcst_day_3"] == null ? null : FcstDayModel.fromJson(json["fcst_day_3"]),
    fcstDay4: json["fcst_day_4"] == null ? null : FcstDayModel.fromJson(json["fcst_day_4"]),
  );

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