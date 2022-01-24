import 'package:flutter/material.dart';
import 'package:weather_app/src/navigator.dart';
import 'package:weather_app/src/ui/home/page/home_page.dart';


class IRoute {
  static const String root = "/";
  static const String homePage = "home_page";

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return _materialRoute(const NavigatorPage());
      case homePage:
        return _materialRoute(const HomePage());
      default:
        return _materialRoute(const SizedBox());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
