import 'package:bloc/bloc.dart';
import 'package:weather_app/src/core/exceptions/cache_exception.dart';
import 'package:weather_app/src/core/exceptions/connection_exception.dart';
import 'package:weather_app/src/core/exceptions/request_exception.dart';
import 'package:weather_app/src/core/requests/get_city_weather/get_city_weather_request.dart';
import 'package:weather_app/src/core/requests/get_weather/get_weather_request.dart';
import 'package:weather_app/src/domain/domain/weather.dart';
import 'package:weather_app/src/domain/usecases/get_city_weather.dart';
import 'package:weather_app/src/domain/usecases/get_weather.dart';
import 'package:weather_app/src/ui/home/bloc/get_weather.dart';
import 'package:dartz/dartz.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  final GetCityWeatherUseCase _getCityWeatherUseCase;
  final GetWeatherUseCase _getWeatherUseCase;

  GetWeatherBloc({
    required GetCityWeatherUseCase getCityWeatherUseCase,
    required GetWeatherUseCase getWeatherUseCase,
}) : assert(getWeatherUseCase!=null),
     assert(getCityWeatherUseCase!=null),
      _getWeatherUseCase = getWeatherUseCase,
      _getCityWeatherUseCase = getCityWeatherUseCase,
        super(GetWeatherEmpty());

  @override
  Stream<GetWeatherState> mapEventToState( GetWeatherEvent event,) async* {
    if(event is StartGetWeather){
      yield GetWeatherLoading();
      final failureOrWeatherResponse = await _getWeatherUseCase(params: GetWeatherRequest());
      yield* _eitherLoadedOrErrorState(failureOrWeatherResponse);
    }else if(event is StartCityGetWeather){
      final failureOrCityWeatherResponse = await _getCityWeatherUseCase(params: GetCityWeatherRequest(city: event.city));
      yield* _eitherLoadedOrErrorState(failureOrCityWeatherResponse);
    }
  }
}

Stream<GetWeatherState> _eitherLoadedOrErrorState(
    Either<RequestException, Weather> either,
    ) async* {
  yield either.fold(
        (failure) => GetWeatherError(message: _mapFailureToMessage(failure)),
        (weather) => GetWeatherLoaded(weather: weather),
  );
}

String _mapFailureToMessage(RequestException requestException) {
  switch (requestException.runtimeType) {
    case CacheException:
      return requestException.message;
    case ConnectionException:
      return requestException.message;
    case RequestException:
      return requestException.message;
    default:
      return 'Unexpected Error';
  }
}

