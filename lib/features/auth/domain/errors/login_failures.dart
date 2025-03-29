import '../../../../core/errors/failures.dart';

sealed class LoginFailure extends Failure {
  const LoginFailure({
    required super.message,
    super.stackTrace,
  });

  @override
  List<Object?> get props => [message];
}

class LoginInvalidCredentials extends LoginFailure {
  const LoginInvalidCredentials({
    super.stackTrace,
  }) : super(message: 'Credenciais inválidas');
}

class LoginInvalidTOTPCode extends LoginFailure {
  const LoginInvalidTOTPCode({
    super.stackTrace,
  }) : super(message: 'Código TOTP inválido');
}
