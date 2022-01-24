import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather_app/src/core/exceptions/request_exception.dart';
import 'package:weather_app/src/core/platforms/dio_http_client/dio_http_client.dart';
import 'package:weather_app/src/core/platforms/dio_http_client/http_data_source.dart';
import 'package:weather_app/src/data/models/weather_model.dart';

class WeatherApiService extends HttpDataSource<DioHttpClient> {
  WeatherApiService({required DioHttpClient client}) : super(client);

  Future<WeatherModel> getLimogesWeather() async {
    try{
      final response = await client.get(path:"https://www.prevision-meteo.ch/services/json/limoges");
      final responseJson = json.decode(json.encode(response));
      return WeatherModel.fromJson(responseJson);
    }on DioError catch (e){
      throw RequestException(message: e.message);
    }
  }

  Future<WeatherModel> getCityWeather(String city) async {
    try{
      final response = await client.get(path:"https://www.prevision-meteo.ch/services/json/$city");
      final responseJson = json.decode(json.encode(response));
      return WeatherModel.fromJson(responseJson);
    }on DioError catch (e){
      throw RequestException(message: e.message);
    }
  }
}
