import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/color_constants.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0XFF317D33),
      ),
      scaffoldBackgroundColor: ColorConstants.white,
      primaryColor: ColorConstants.primaryColorLight,
      splashColor: Colors.transparent,
    );
  }
}
