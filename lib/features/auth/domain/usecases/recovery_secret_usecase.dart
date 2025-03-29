import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

abstract class RecoverySecretUsecase {
  Future<Either<Failure, bool>> call(String code);
}

@LazySingleton(as: RecoverySecretUsecase)
class RecoverySecretUsecaseImpl implements RecoverySecretUsecase {
  final AuthRepository _authRepository;

  RecoverySecretUsecaseImpl(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(String code) async {
    return await _authRepository.recoverySecret(code);
  }
}
