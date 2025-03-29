part of 'recovery_secret_bloc.dart';

sealed class RecoverySecretState extends Equatable {
  const RecoverySecretState();

  @override
  List<Object> get props => [];
}

final class RecoverySecretInitialState extends RecoverySecretState {}

final class RecoverySecretLoadingState extends RecoverySecretState {}

final class RecoverySecretSuccessState extends RecoverySecretState {
  const RecoverySecretSuccessState();

  @override
  List<Object> get props => [];
}

final class RecoverySecretErrorState extends RecoverySecretState {
  final String message;

  const RecoverySecretErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class RecoverySecretUserNotFoundState extends RecoverySecretState {
  final String message;

  const RecoverySecretUserNotFoundState(this.message);

  @override
  List<Object> get props => [message];
}

final class RecoverySecretInvalidPasswordState extends RecoverySecretState {
  final String message;

  const RecoverySecretInvalidPasswordState(this.message);

  @override
  List<Object> get props => [message];
}

final class RecoverySecretInvalidCodeState extends RecoverySecretState {
  final String message;

  const RecoverySecretInvalidCodeState(this.message);

  @override
  List<Object> get props => [message];
}
