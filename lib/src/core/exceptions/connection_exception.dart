
import 'package:weather_app/src/core/exceptions/request_exception.dart';

class ConnectionException extends RequestException {
  ConnectionException({ required message}) : super(
    message: message
  );
}