import 'package:equatable/equatable.dart';

class HourlyDatum extends Equatable{
  HourlyDatum({
     this.icon,
     this.condition,
     this.conditionKey,
     this.tmp2M,
     this.dpt2M,
     this.wndchill2M,
     this.humidex,
     this.rh2M,
     this.prmsl,
     this.apcPsfc,
     this.wndspd10M,
     this.wndgust10M,
     this.wnddir10M,
     this.issnow,
     this.hcdc,
     this.mcdc,
     this.lcdc,
     this.hgt0C,
     this.kindex,
     this.cape1800,
     this.cin1800,
  });

  final String? icon;
  final String? condition;
  final String? conditionKey;
  final double? tmp2M;
  final double? dpt2M;
  final double? wndchill2M;
  final dynamic? humidex;
  final int? rh2M;
  final double? prmsl;
  final double? apcPsfc;
  final int? wndspd10M;
  final int? wndgust10M;
  final int? wnddir10M;
  final int? issnow;
  final String? hcdc;
  final String? mcdc;
  final String? lcdc;
  final int? hgt0C;
  final int? kindex;
  final String? cape1800;
  final int? cin1800;

  factory HourlyDatum.fromJson(Map<String, dynamic> json) => HourlyDatum(
    icon: json["ICON"] == null ? null : json["ICON"],
    condition: json["CONDITION"] == null ? null : json["CONDITION"],
    conditionKey: json["CONDITION_KEY"] == null ? null : json["CONDITION_KEY"],
    tmp2M: json["TMP2m"] == null ? null : json["TMP2m"].toDouble(),
    dpt2M: json["DPT2m"] == null ? null : json["DPT2m"].toDouble(),
    wndchill2M: json["WNDCHILL2m"] == null ? null : json["WNDCHILL2m"].toDouble(),
    humidex: json["HUMIDEX"],
    rh2M: json["RH2m"] == null ? null : json["RH2m"],
    prmsl: json["PRMSL"] == null ? null : json["PRMSL"].toDouble(),
    apcPsfc: json["APCPsfc"] == null ? null : json["APCPsfc"],
    wndspd10M: json["WNDSPD10m"] == null ? null : json["WNDSPD10m"],
    wndgust10M: json["WNDGUST10m"] == null ? null : json["WNDGUST10m"],
    wnddir10M: json["WNDDIR10m"] == null ? null : json["WNDDIR10m"],
    issnow: json["ISSNOW"] == null ? null : json["ISSNOW"],
    hcdc: json["HCDC"] == null ? null : json["HCDC"],
    mcdc: json["MCDC"] == null ? null : json["MCDC"],
    lcdc: json["LCDC"] == null ? null : json["LCDC"],
    hgt0C: json["HGT0C"] == null ? null : json["HGT0C"],
    kindex: json["KINDEX"] == null ? null : json["KINDEX"],
    cape1800: json["CAPE180_0"] == null ? null : json["CAPE180_0"],
    cin1800: json["CIN180_0"] == null ? null : json["CIN180_0"],
  );

  Map<String, dynamic> toJson() => {
    "ICON": icon == null ? null : icon,
    "CONDITION": condition == null ? null : condition,
    "CONDITION_KEY": conditionKey == null ? null : conditionKey,
    "TMP2m": tmp2M == null ? null : tmp2M,
    "DPT2m": dpt2M == null ? null : dpt2M,
    "WNDCHILL2m": wndchill2M == null ? null : wndchill2M,
    "HUMIDEX": humidex,
    "RH2m": rh2M == null ? null : rh2M,
    "PRMSL": prmsl == null ? null : prmsl,
    "APCPsfc": apcPsfc == null ? null : apcPsfc,
    "WNDSPD10m": wndspd10M == null ? null : wndspd10M,
    "WNDGUST10m": wndgust10M == null ? null : wndgust10M,
    "WNDDIR10m": wnddir10M == null ? null : wnddir10M,
    "ISSNOW": issnow == null ? null : issnow,
    "HCDC": hcdc == null ? null : hcdc,
    "MCDC": mcdc == null ? null : mcdc,
    "LCDC": lcdc == null ? null : lcdc,
    "HGT0C": hgt0C == null ? null : hgt0C,
    "KINDEX": kindex == null ? null : kindex,
    "CAPE180_0": cape1800 == null ? null : cape1800,
    "CIN180_0": cin1800 == null ? null : cin1800,
  };

  @override
  List<Object?> get props => [];
}