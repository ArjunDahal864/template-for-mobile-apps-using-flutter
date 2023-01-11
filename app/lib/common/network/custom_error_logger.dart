import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';

/// CustomErrorLogger logs request,response and error
class CustomErrorLogger extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    FLog.error(
      text: err.error,
      className: "CustomErrorLogger",
      methodName: "onError",
      exception: err,
    );
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    FLog.info(
      text: json.encode(options.data) + options.path,
      className: "CustomErrorLogger",
      methodName: "onRequest",
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    FLog.info(
      text: json.encode(response.data),
      className: "CustomErrorLogger",
      methodName: "onResponse",
    );
    super.onResponse(response, handler);
  }
}
