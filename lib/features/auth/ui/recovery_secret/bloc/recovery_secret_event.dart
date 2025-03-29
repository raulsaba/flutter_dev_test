part of 'recovery_secret_bloc.dart';

sealed class RecoverySecretEvent extends Equatable {
  const RecoverySecretEvent();

  @override
  List<Object> get props => [];
}

final class RecoverySecretRequestEvent extends RecoverySecretEvent {
  final String code;

  const RecoverySecretRequestEvent({
    required this.code,
  });

  @override
  List<Object> get props => [code];
}
