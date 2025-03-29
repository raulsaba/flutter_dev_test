import 'package:dio/dio.dart';

final class ServerException implements Exception {
  final String message;
  final Response? response;

  const ServerException({
    this.message = 'Server error',
    this.response,
  });

  @override
  String toString() => 'ServerException: $message';
}
