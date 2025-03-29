import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/login_request_entity.dart';
import '../../../domain/errors/login_failures.dart';
import '../../../domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUsecase) : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginRequestEvent) {
        emit(LoginLoadingState());
        final result = await _loginUsecase.call(event.toEntity());
        result.fold(
          (failure) {
            if (failure is LoginFailure) {
              switch (failure) {
                case LoginInvalidTOTPCode _:
                  emit(LoginInvalidTOTPState());
                case LoginInvalidCredentials _:
                  emit(LoginInvalidCredentialsState(failure.message));
              }
            } else {
              emit(LoginErrorState(failure.message));
            }
          },
          (response) => emit(LoginSuccessState()),
        );
      }
    });
  }

  final LoginUsecase _loginUsecase;
}
