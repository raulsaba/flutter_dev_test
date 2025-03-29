import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final StackTrace? stackTrace;

  const Failure({
    required this.message,
    this.stackTrace,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.stackTrace,
  });

  @override
  List<Object?> get props => [message];
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    super.stackTrace,
  });

  @override
  List<Object?> get props => [message];
}
