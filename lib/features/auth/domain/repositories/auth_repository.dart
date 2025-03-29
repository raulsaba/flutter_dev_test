import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/login_request_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(LoginRequestEntity entity);
  Future<Either<Failure, bool>> recoverySecret(String code);
}
