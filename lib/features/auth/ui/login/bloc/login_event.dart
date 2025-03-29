part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginRequestEvent extends LoginEvent {
  final String username;
  final String password;

  const LoginRequestEvent({
    required this.username,
    required this.password,
  });

  LoginRequestEntity toEntity() {
    return LoginRequestEntity(
      username: username,
      password: password,
    );
  }

  @override
  List<Object> get props => [username, password];
}
