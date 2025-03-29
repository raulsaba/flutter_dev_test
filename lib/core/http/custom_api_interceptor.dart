import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('Request: ${options.method} ${options.uri}');
    options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response: ${response.statusCode} ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Error: ${err.message}');
    super.onError(err, handler);
  }
}
