import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/config/env_config.dart';
import 'package:weather_app/src/core/constants/storage_keys.dart';
import 'package:weather_app/src/core/exceptions/cache_exception.dart';
import 'package:weather_app/src/data/models/weather_model.dart';
import 'package:weather_app/src/core/platforms/local_storage/local_storage.dart';

class WeatherLocalDbService extends LocalStorage with StorageKeys, EnvConfig{
  WeatherLocalDbService(SharedPreferences? pref) : super(
    pref: pref
  );

  Future<void> cacheWeather(WeatherModel weatherToCache) async {
    final save = json.encode(weatherToCache.toJson());
    write(StorageKeys.cachedWeather, save);
  }

  Future<WeatherModel> getLocalWeather() {
    final numberTriviaJsonString = read(StorageKeys.cachedWeather);
    if (numberTriviaJsonString != null) {
      return Future.value(WeatherModel.fromJson(json.decode(numberTriviaJsonString)));
    } else {
      throw CacheException(message: EnvConfig.failureToLoadDataLocally);
    }
  }
}
