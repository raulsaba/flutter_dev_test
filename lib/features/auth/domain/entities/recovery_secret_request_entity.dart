import 'package:equatable/equatable.dart';

class RecoverySecretRequestEntity extends Equatable {
  final String username;
  final String password;
  final String code;

  const RecoverySecretRequestEntity({
    required this.username,
    required this.password,
    required this.code,
  });

  @override
  List<Object?> get props => [username, password, code];
}
