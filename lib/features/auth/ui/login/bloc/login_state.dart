part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginInvalidTOTPState extends LoginState {}

final class LoginInvalidCredentialsState extends LoginState {
  final String message;

  const LoginInvalidCredentialsState(this.message);

  @override
  List<Object> get props => [message];
}

final class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState(this.message);

  @override
  List<Object> get props => [message];
}
