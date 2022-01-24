import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/exceptions/request_exception.dart';
import 'package:weather_app/src/core/requests/get_weather/get_weather_request.dart';
import 'package:weather_app/src/core/usecase/get_weather/get_weather.dart';
import 'package:weather_app/src/domain/domain/weather.dart';
import 'package:weather_app/src/domain/repositories/get_weather_repository.dart';

class GetWeatherUseCase implements UseCaseGetWeather<Either<RequestException, Weather>, GetWeatherRequest> {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  @override
  Future<Either<RequestException, Weather>> call({required GetWeatherRequest params}) {
    return _weatherRepository.getLimogesWeather();
  }
}
