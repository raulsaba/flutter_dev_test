import 'package:equatable/equatable.dart';

class LoginRequestEntity extends Equatable {
  final String username;
  final String password;
  final String? totpCode;

  const LoginRequestEntity({
    required this.username,
    required this.password,
    this.totpCode,
  });

  @override
  List<Object?> get props => [username, password, totpCode];
}
