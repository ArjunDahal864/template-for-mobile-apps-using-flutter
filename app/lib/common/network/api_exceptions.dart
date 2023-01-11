import 'package:dio/dio.dart';

abstract class APIExceptions extends DioError {
  final String? errorMessage;

  APIExceptions({required super.requestOptions, this.errorMessage});
}

class DeadLineExceededException extends APIExceptions {
  DeadLineExceededException({required super.requestOptions, super.errorMessage});
  @override
  String toString() {
    return errorMessage ?? "Can't Connect to Server";
  }
}

class BadRequestException extends APIExceptions {
  BadRequestException({
    required super.errorMessage,
    required super.requestOptions,
  });
  @override
  String toString() {
    return errorMessage ?? "Bad Request";
  }
}

class ContentNotFoundException extends APIExceptions {
  ContentNotFoundException({required super.requestOptions, super.errorMessage});
  @override
  String toString() {
    return errorMessage ?? "Content Not Found";
  }
}

class OtherException extends APIExceptions {
  OtherException({required super.requestOptions, super.errorMessage});
}

class DataNotFoundException implements Exception {
  final String? message;
  const DataNotFoundException({required this.message});
  @override
  String toString() {
    return message ?? "Data Not Found";
  }
}
