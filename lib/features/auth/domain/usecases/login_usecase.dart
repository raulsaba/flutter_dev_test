import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/login_request_entity.dart';
import '../repositories/auth_repository.dart';

abstract class LoginUsecase {
  Future<Either<Failure, bool>> call(LoginRequestEntity entity);
}

@LazySingleton(as: LoginUsecase)
class LoginUsecaseImpl implements LoginUsecase {
  final AuthRepository _authRepository;

  LoginUsecaseImpl(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(LoginRequestEntity entity) async {
    return await _authRepository.login(entity);
  }
}
