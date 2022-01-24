
import 'package:weather_app/src/core/exceptions/request_exception.dart';

abstract class Failure extends  RequestException{
  Failure({required message}) : super(
    message: message,
  );
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({required message}) : super(
    message: message,
  );

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  CacheFailure({required message}) : super(
    message: message
  );

  @override
  List<Object?> get props => [];
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required message}) : super(
    message: message
  );

  @override
  List<Object?> get props => [];
}