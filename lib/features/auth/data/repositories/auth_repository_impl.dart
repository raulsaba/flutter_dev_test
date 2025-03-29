import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/totp_utils.dart';
import '../../domain/entities/login_request_entity.dart';
import '../../domain/errors/login_failures.dart';
import '../../domain/errors/recovery_secret_failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';
import '../models/recovery_request_secret_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl(this._authRemoteDatasource);

  String _totpSecret = '';

  LoginRequestEntity? lastLoginRequest;

  @override
  Future<Either<Failure, bool>> login(LoginRequestEntity entity) async {
    try {
      lastLoginRequest = null;
      final totpCode = _totpSecret.isNotEmpty ? TOTPUtils.generateTOTP(_totpSecret) : '';
      final result = await _authRemoteDatasource.login(LoginRequestModel.fromEntity(entity, totpCode));
      return Right(result);
    } on ServerException catch (e) {
      if (e.response?.data['message'].contains('Invalid TOTP code')) {
        lastLoginRequest = entity;
        return Left(LoginInvalidTOTPCode(stackTrace: StackTrace.current));
      } else if (e.response?.data['message'].contains('Invalid credentials')) {
        return Left(LoginInvalidCredentials(stackTrace: StackTrace.current));
      } else {
        return Left(ServerFailure(message: e.message, stackTrace: StackTrace.current));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.toString(), stackTrace: StackTrace.current));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString(), stackTrace: StackTrace.current));
    }
  }

  @override
  Future<Either<Failure, bool>> recoverySecret(String code) async {
    try {
      final result = await _authRemoteDatasource.recoverySecret(RecoveryRequestSecretModel(
        username: lastLoginRequest?.username ?? '',
        password: lastLoginRequest?.password ?? '',
        code: code,
      ));
      _totpSecret = result;
      return const Right(true);
    } on ServerException catch (e) {
      if (e.response != null) {
        if (e.response?.data['message'].contains('Invalid recovery code')) {
          return Left(RecoverySecretInvalidCode(stackTrace: StackTrace.current));
        } else if (e.response?.data['message'].contains('Invalid password')) {
          return Left(RecoverySecretInvalidPassword(stackTrace: StackTrace.current));
        } else if (e.response?.data['message'].contains('User not found')) {
          return Left(RecoverySecretUserNotFound(stackTrace: StackTrace.current));
        }
      }
      return Left(ServerFailure(message: e.message, stackTrace: StackTrace.current));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.toString(), stackTrace: StackTrace.current));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString(), stackTrace: StackTrace.current));
    }
  }
}
