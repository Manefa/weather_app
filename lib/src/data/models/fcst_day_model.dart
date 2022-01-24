import 'package:weather_app/src/data/models/hourly_datum_model.dart';
import 'package:weather_app/src/domain/domain/fcst_day.dart';

class FcstDayModel extends FcstDay{
  FcstDayModel({
    required String? date,
    required String? dayShort,
    required String? dayLong,
    required int? tmin,
    required int? tmax,
    required String? condition,
    required String? conditionKey,
    required String? icon,
    required String? iconBig,
    required Map<String, HourlyDatumModel>? hourlyData,
  }) : super(
    date: date,
    dayShort: dayShort,
    dayLong: dayLong,
    tmin: tmin,
    tmax: tmax,
    condition: condition,
    conditionKey: conditionKey,
    icon: icon,
    iconBig: iconBig,
    hourlyData: hourlyData,
  );


  factory FcstDayModel.fromJson(Map<String, dynamic> json) => FcstDayModel(
    date: json["date"] == null ? null : json["date"],
    dayShort: json["day_short"] == null ? null : json["day_short"],
    dayLong: json["day_long"] == null ? null : json["day_long"],
    tmin: json["tmin"] == null ? null : json["tmin"],
    tmax: json["tmax"] == null ? null : json["tmax"],
    condition: json["condition"] == null ? null : json["condition"],
    conditionKey: json["condition_key"] == null ? null : json["condition_key"],
    icon: json["icon"] == null ? null : json["icon"],
    iconBig: json["icon_big"] == null ? null : json["icon_big"],
    hourlyData: json["hourly_data"] == null ? null : Map.from(json["hourly_data"]).map((k, v) => MapEntry<String, HourlyDatumModel>(k, HourlyDatumModel.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date,
    "day_short": dayShort == null ? null : dayShort,
    "day_long": dayLong == null ? null : dayLong,
    "tmin": tmin == null ? null : tmin,
    "tmax": tmax == null ? null : tmax,
    "condition": condition == null ? null : condition,
    "condition_key": conditionKey == null ? null : conditionKey,
    "icon": icon == null ? null : icon,
    "icon_big": iconBig == null ? null : iconBig,
    "hourly_data": hourlyData == null ? null : Map.from(hourlyData!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };

  @override
  List<Object?> get props => [date, dayShort, dayLong, tmin, tmax, condition, conditionKey, icon, iconBig, hourlyData];
}