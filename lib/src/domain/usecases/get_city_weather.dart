import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/exceptions/request_exception.dart';
import 'package:weather_app/src/core/requests/get_city_weather/get_city_weather_request.dart';
import 'package:weather_app/src/core/usecase/get_city_weather/get_city_weather.dart';
import 'package:weather_app/src/domain/domain/weather.dart';
import 'package:weather_app/src/domain/repositories/get_weather_repository.dart';

class GetCityWeatherUseCase implements UseCaseGetCityWeather<Either<RequestException, Weather>, GetCityWeatherRequest> {
  final WeatherRepository _weatherRepository;

  GetCityWeatherUseCase(this._weatherRepository);

  @override
  Future<Either<RequestException, Weather>> call({required GetCityWeatherRequest params}) {
    return _weatherRepository.getCityWeather(params);
  }
}
