import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/errors/recovery_secret_failures.dart';
import '../../../domain/usecases/recovery_secret_usecase.dart';

part 'recovery_secret_event.dart';
part 'recovery_secret_state.dart';

@injectable
class RecoverySecretBloc extends Bloc<RecoverySecretEvent, RecoverySecretState> {
  RecoverySecretBloc(this._recoverySecretUsecase) : super(RecoverySecretInitialState()) {
    on<RecoverySecretEvent>((event, emit) async {
      if (event is RecoverySecretRequestEvent) {
        emit(RecoverySecretLoadingState());
        final result = await _recoverySecretUsecase.call(event.code);
        result.fold(
          (failure) {
            if (failure is RecoverySecretFailure) {
              switch (failure) {
                case RecoverySecretInvalidCode _:
                  emit(RecoverySecretInvalidCodeState(failure.message));
                  break;
                case RecoverySecretInvalidPassword _:
                  emit(RecoverySecretInvalidPasswordState(failure.message));
                  break;
                case RecoverySecretUserNotFound _:
                  emit(RecoverySecretUserNotFoundState(failure.message));
                  break;
              }
            } else {
              emit(RecoverySecretErrorState(failure.message));
            }
          },
          (response) => emit(const RecoverySecretSuccessState()),
        );
      }
    });
  }

  final RecoverySecretUsecase _recoverySecretUsecase;
}
