import 'package:weather_app/src/core/requests/i_request.dart';
import '/src/core/resources/types.dart';

class GetWeatherRequest implements IRequest {
  GetWeatherRequest();

  @override
  Json toJson() {
    return {
    };
  }
}
