import 'package:equatable/equatable.dart';

class CurrentCondition extends Equatable{
  const CurrentCondition({
    required this.date,
    required this.hour,
    required this.tmp,
    required this.wndSpd,
    required this.wndGust,
    required this.pressure,
    required this.humidity,
    required this.icon,
    required this.iconBig,
  });

  final String? date;
  final String? hour;
  final int? tmp;
  final int? wndSpd;
  final int? wndGust;
  final double? pressure;
  final int? humidity;
  final String? icon;
  final String? iconBig;

  // factory CurrentCondition.fromJson(Map<String, dynamic> json) => CurrentCondition(
  //   date: json["date"] == null ? null : json["date"],
  //   hour: json["hour"] == null ? null : json["hour"],
  //   tmp: json["tmp"] == null ? null : json["tmp"],
  //   wndSpd: json["wnd_spd"] == null ? null : json["wnd_spd"],
  //   wndGust: json["wnd_gust"] == null ? null : json["wnd_gust"],
  //   wndDir: json["wnd_dir"] == null ? null : json["wnd_dir"],
  //   pressure: json["pressure"] == null ? null : json["pressure"].toDouble(),
  //   humidity: json["humidity"] == null ? null : json["humidity"],
  //   icon: json["icon"] == null ? null : json["icon"],
  //   iconBig: json["icon_big"] == null ? null : json["icon_big"],
  // );

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