import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/get_it/get_it_config.dart';
import 'bloc/login_bloc.dart';
import 'login_page.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginBloc>(),
      child: const LoginPage(),
    );
  }
}
