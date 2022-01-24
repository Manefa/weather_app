import 'package:equatable/equatable.dart';

abstract class GetWeatherEvent extends Equatable {
  const GetWeatherEvent();
}

class StartGetWeather extends GetWeatherEvent{

  @override
  List<Object?> get props => [];
}

class StartCityGetWeather extends GetWeatherEvent{
  final String city;

  const StartCityGetWeather({required this.city});
  @override
  List<Object?> get props => [city];
}