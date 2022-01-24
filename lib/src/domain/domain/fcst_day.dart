import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/domain/hourly_datum.dart';

class FcstDay extends Equatable{
  const FcstDay({
    required this.date,
    required this.dayShort,
    required this.dayLong,
    required this.tmin,
    required this.tmax,
    required this.condition,
    required this.conditionKey,
    required this.icon,
    required this.iconBig,
    required this.hourlyData,
  });

  final String? date;
  final String? dayShort;
  final String? dayLong;
  final int? tmin;
  final int? tmax;
  final String? condition;
  final String? conditionKey;
  final String? icon;
  final String? iconBig;
  final Map<String, HourlyDatum>? hourlyData;

  // factory FcstDay.fromJson(Map<String, dynamic> json) => FcstDay(
  //   date: json["date"] == null ? null : json["date"],
  //   dayShort: json["day_short"] == null ? null : json["day_short"],
  //   dayLong: json["day_long"] == null ? null : json["day_long"],
  //   tmin: json["tmin"] == null ? null : json["tmin"],
  //   tmax: json["tmax"] == null ? null : json["tmax"],
  //   condition: json["condition"] == null ? null : json["condition"],
  //   conditionKey: json["condition_key"] == null ? null : json["condition_key"],
  //   icon: json["icon"] == null ? null : json["icon"],
  //   iconBig: json["icon_big"] == null ? null : json["icon_big"],
  //   hourlyData: json["hourly_data"] == null ? null : Map.from(json["hourly_data"]).map((k, v) => MapEntry<String, HourlyDatum>(k, HourlyDatum.fromJson(v))),
  // );

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