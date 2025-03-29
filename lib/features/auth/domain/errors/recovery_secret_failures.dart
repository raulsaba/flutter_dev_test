import '../../../../core/errors/failures.dart';

sealed class RecoverySecretFailure extends Failure {
  const RecoverySecretFailure({
    required super.message,
    super.stackTrace,
  });

  @override
  List<Object?> get props => [message];
}

class RecoverySecretUserNotFound extends RecoverySecretFailure {
  const RecoverySecretUserNotFound({
    super.stackTrace,
  }) : super(message: 'Usuário não encontrado');
}

class RecoverySecretInvalidPassword extends RecoverySecretFailure {
  const RecoverySecretInvalidPassword({
    super.stackTrace,
  }) : super(message: 'Senha inválida');
}

class RecoverySecretInvalidCode extends RecoverySecretFailure {
  const RecoverySecretInvalidCode({
    super.stackTrace,
  }) : super(message: 'Código inválido');
}
