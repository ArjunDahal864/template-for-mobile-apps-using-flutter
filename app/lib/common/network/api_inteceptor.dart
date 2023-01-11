import 'package:dio/dio.dart';
import 'api_exceptions.dart';

class APIInterceptor extends Interceptor {
  final Dio dio;

  APIInterceptor(this.dio);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    //TODO: add interceptor
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadLineExceededException(requestOptions: err.requestOptions, errorMessage: "Can't Connect to Server");
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(
              requestOptions: err.requestOptions,
              errorMessage: err.response?.data['message'],
            );

          case 404:
            throw ContentNotFoundException(
              requestOptions: err.requestOptions,
              errorMessage: err.response?.data['message'],
            );
          default:
            return handler.next(err);
        }
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw OtherException(requestOptions: err.requestOptions, errorMessage: "Something went wrong");
    }
    return handler.next(err);
  }
}
