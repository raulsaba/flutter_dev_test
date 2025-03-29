import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../errors/exceptions.dart';
import 'custom_api_interceptor.dart';

@singleton
class ApiHttp {
  final Dio dio = Dio();

  ApiHttp() {
    dio.options.baseUrl = 'http://10.0.2.2:5000'; // aqui pode ser puxado de um arquivo env de configuração
    dio.interceptors.add(CustomApiInterceptor());
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } on DioException catch (err) {
      switch (err.type) {
        case DioExceptionType.badResponse:
          if (err.response != null) {
            if (err.response?.statusCode == 401) {
              throw ServerException(message: 'Unauthorized', response: err.response);
            } else if (err.response?.statusCode == 403) {
              throw ServerException(message: 'Forbidden', response: err.response);
            } else if (err.response?.statusCode == 404) {
              throw ServerException(message: 'Not found', response: err.response);
            } else if (err.response?.statusCode == 500) {
              throw ServerException(message: 'Internal server error', response: err.response);
            }
          }
          throw ServerException(message: 'Bad response: ${err.response?.statusCode}', response: err.response);
        default:
          rethrow;
      }
    }
  }
}
