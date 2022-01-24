import 'package:equatable/equatable.dart';

class RequestException extends Equatable with Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  RequestException({required this.message, this.statusCode, this.data});

  @override
  List<Object?> get props => [message, statusCode, data];
}


