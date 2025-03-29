import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/http/api_http.dart';
import '../models/login_request_model.dart';
import '../models/recovery_request_secret_model.dart';

abstract class AuthRemoteDatasource {
  Future<bool> login(LoginRequestModel model);
  Future<String> recoverySecret(RecoveryRequestSecretModel model);
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl(this._apiHttp);

  final ApiHttp _apiHttp;

  final String _baseUrl = '/auth';

  @override
  Future<bool> login(LoginRequestModel model) async {
    try {
      final Response response = await _apiHttp.post(
        '$_baseUrl/login',
        data: model.toJson(),
      );

      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> recoverySecret(RecoveryRequestSecretModel model) async {
    try {
      final Response response = await _apiHttp.post(
        '$_baseUrl/recovery-secret',
        data: model.toJson(),
      );

      return response.statusCode == 200 ? response.data['totp_secret'] : 'Error';
    } catch (e) {
      rethrow;
    }
  }
}
