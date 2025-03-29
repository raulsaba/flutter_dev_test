// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_dev_test/core/http/api_http.dart' as _i808;
import 'package:flutter_dev_test/features/auth/data/datasources/auth_remote_datasource.dart' as _i332;
import 'package:flutter_dev_test/features/auth/data/repositories/auth_repository_impl.dart' as _i522;
import 'package:flutter_dev_test/features/auth/domain/repositories/auth_repository.dart' as _i879;
import 'package:flutter_dev_test/features/auth/domain/usecases/login_usecase.dart' as _i1036;
import 'package:flutter_dev_test/features/auth/domain/usecases/recovery_secret_usecase.dart' as _i604;
import 'package:flutter_dev_test/features/auth/ui/login/bloc/login_bloc.dart' as _i76;
import 'package:flutter_dev_test/features/auth/ui/recovery_secret/bloc/recovery_secret_bloc.dart' as _i21;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i808.ApiHttp>(() => _i808.ApiHttp());
    gh.lazySingleton<_i332.AuthRemoteDatasource>(() => _i332.AuthRemoteDatasourceImpl(gh<_i808.ApiHttp>()));
    gh.lazySingleton<_i879.AuthRepository>(() => _i522.AuthRepositoryImpl(gh<_i332.AuthRemoteDatasource>()));
    gh.lazySingleton<_i604.RecoverySecretUsecase>(() => _i604.RecoverySecretUsecaseImpl(gh<_i879.AuthRepository>()));
    gh.factory<_i21.RecoverySecretBloc>(() => _i21.RecoverySecretBloc(gh<_i604.RecoverySecretUsecase>()));
    gh.lazySingleton<_i1036.LoginUsecase>(() => _i1036.LoginUsecaseImpl(gh<_i879.AuthRepository>()));
    gh.factory<_i76.LoginBloc>(() => _i76.LoginBloc(gh<_i1036.LoginUsecase>()));
    return this;
  }
}
