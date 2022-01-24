import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/domain/weather.dart';

abstract class GetWeatherState extends Equatable {
  const GetWeatherState();
}

class GetWeatherEmpty extends GetWeatherState {
  @override
  List<Object> get props => [];
}

class GetWeatherLoading extends GetWeatherState {
  @override
  List<Object> get props => [];
}

class GetWeatherLoaded extends GetWeatherState {
  final Weather weather;

  const GetWeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}

class GetWeatherError extends GetWeatherState {
  final String message;

  const GetWeatherError({required this.message});
  @override
  List<Object> get props => [message];
}
