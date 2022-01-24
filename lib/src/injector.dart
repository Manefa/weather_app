import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/core/platforms/dio_http_client/dio_http_client.dart';
import 'package:weather_app/src/core/platforms/local_storage/local_storage.dart';
import 'package:weather_app/src/core/platforms/network_info/network_info.dart';
import 'package:weather_app/src/data/datasources/local/weather_local_data_source_service.dart';
import 'package:weather_app/src/data/datasources/remote/weather_api_service.dart';
import 'package:weather_app/src/data/repositories/get_weather_repository_impl.dart';
import 'package:weather_app/src/domain/repositories/get_weather_repository.dart';
import 'package:weather_app/src/domain/usecases/get_city_weather.dart';
import 'package:weather_app/src/domain/usecases/get_weather.dart';
import 'package:weather_app/src/ui/home/bloc/get_weather.dart';


final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /// Register service locators
  ///
  /// Misc
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);
  injector.registerLazySingleton<LocalStorage>(() => LocalStorage(pref: injector()));
  injector.registerLazySingleton<DioHttpClient>(() => DioHttpClient());
  injector.registerLazySingleton(() => InternetConnectionChecker());
  injector.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));

  /// Register services
  /// Number Trivia
  injector.registerLazySingleton<WeatherApiService>(() => WeatherApiService(client: injector(),));

  injector.registerLazySingleton<WeatherLocalDbService>(() =>WeatherLocalDbService(injector()));

  /// Register repositories
  injector.registerLazySingleton<WeatherRepository>( () => WeatherRepositoryImpl(
    weatherApiService: injector(),
    weatherLocalDbService: injector(),
    networkInfo: injector(),
  ));

  /// Register use cases
  injector.registerLazySingleton<GetWeatherUseCase>( () => GetWeatherUseCase(injector()));
  injector.registerLazySingleton<GetCityWeatherUseCase>( () => GetCityWeatherUseCase(injector()));

  injector.registerFactory<GetWeatherBloc>(
        () => GetWeatherBloc(
          getWeatherUseCase: injector(),
          getCityWeatherUseCase: injector(),
    ),
  );

}
