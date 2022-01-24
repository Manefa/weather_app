import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/exceptions/request_exception.dart';
import 'package:weather_app/src/core/requests/get_city_weather/get_city_weather_request.dart';
import 'package:weather_app/src/domain/domain/weather.dart';

abstract class WeatherRepository {
  Future<Either<RequestException, Weather>> getLimogesWeather();
  Future<Either<RequestException, Weather>> getCityWeather(GetCityWeatherRequest params);
}
