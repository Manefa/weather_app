import 'package:weather_app/src/core/requests/i_request.dart';
import '/src/core/resources/types.dart';

class GetCityWeatherRequest implements IRequest {
  final String? city;
  GetCityWeatherRequest({required this.city});

  @override
  Json toJson() {
    return {
      "city": city,
    };
  }
}
