import 'package:dartz/dartz.dart';
import 'package:weather_app/src/config/env_config.dart';
import 'package:weather_app/src/core/exceptions/cache_exception.dart';
import 'package:weather_app/src/core/exceptions/failures.dart';
import 'package:weather_app/src/core/exceptions/request_exception.dart';
import 'package:weather_app/src/core/platforms/network_info/network_info.dart';
import 'package:weather_app/src/core/requests/get_city_weather/get_city_weather_request.dart';
import 'package:weather_app/src/data/datasources/local/weather_local_data_source_service.dart';
import 'package:weather_app/src/data/datasources/remote/weather_api_service.dart';
import 'package:weather_app/src/domain/domain/weather.dart';
import 'package:weather_app/src/domain/repositories/get_weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository with EnvConfig{
  final WeatherApiService weatherApiService;
  final WeatherLocalDbService weatherLocalDbService;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.weatherLocalDbService,
    required this.weatherApiService,
    required this.networkInfo});

  @override
  Future<Either<RequestException, Weather>> getCityWeather(GetCityWeatherRequest params) async {
    if(await networkInfo.isConnected){
      try {
        final data = await weatherApiService.getCityWeather(params.city!);
        weatherLocalDbService.cacheWeather(data);
        return Right(data);
      } on RequestException catch (e) {
        return Left(e);
      }
    }else{
      try{
        final localWeather = await weatherLocalDbService.getLocalWeather();
        return Right(localWeather);
      }on CacheException{
        return Left(CacheFailure(message: EnvConfig.failureToLoadDataLocally));
      }
    }
  }


  @override
  Future<Either<RequestException, Weather>> getLimogesWeather() async {
    if(await networkInfo.isConnected){
      try {
        final data = await weatherApiService.getLimogesWeather();
        weatherLocalDbService.cacheWeather(data);
        return Right(data);
      } on RequestException catch (e) {
        return Left(e);
      }
    }else{
      try{
        final localWeather = await weatherLocalDbService.getLocalWeather();
        return Right(localWeather);
      }on CacheException{
        return Left(CacheFailure(message: EnvConfig.failureToLoadDataLocally));
      }
    }
  }
}
