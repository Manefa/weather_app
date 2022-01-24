import 'package:weather_app/src/domain/domain/current_condition.dart';

class CurrentConditionModel extends CurrentCondition{
  const CurrentConditionModel({
    required String? date,
    required String? hour,
    required int? tmp,
    required int? wndSpd,
    required int? wndGust,
    required double? pressure,
    required int? humidity,
    required String? icon,
    required String? iconBig,
  }) : super(
    date: date,
    hour: hour,
    tmp: tmp,
    wndSpd: wndSpd,
    wndGust: wndGust,
    pressure: pressure,
    humidity: humidity,
    icon: icon,
    iconBig: iconBig,
  );

  factory CurrentConditionModel.fromJson(Map<String, dynamic> json) => CurrentConditionModel(
    date: json["date"] == null ? null : json["date"],
    hour: json["hour"] == null ? null : json["hour"],
    tmp: json["tmp"] == null ? null : json["tmp"],
    wndSpd: json["wnd_spd"] == null ? null : json["wnd_spd"],
    wndGust: json["wnd_gust"] == null ? null : json["wnd_gust"],
    pressure: json["pressure"] == null ? null : json["pressure"].toDouble(),
    humidity: json["humidity"] == null ? null : json["humidity"],
    icon: json["icon"] == null ? null : json["icon"],
    iconBig: json["icon_big"] == null ? null : json["icon_big"],
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date,
    "hour": hour == null ? null : hour,
    "tmp": tmp == null ? null : tmp,
    "wnd_spd": wndSpd == null ? null : wndSpd,
    "wnd_gust": wndGust == null ? null : wndGust,
    "pressure": pressure == null ? null : pressure,
    "humidity": humidity == null ? null : humidity,
    "icon": icon == null ? null : icon,
    "icon_big": iconBig == null ? null : iconBig,
  };

  @override
  List<Object?> get props => [];
}