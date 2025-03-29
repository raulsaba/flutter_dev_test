import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/get_it/get_it_config.dart';
import 'bloc/recovery_secret_bloc.dart';
import 'recovery_secret_page.dart';

class RecoverySecretContainer extends StatelessWidget {
  const RecoverySecretContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecoverySecretBloc>(),
      child: const RecoverySecretPage(),
    );
  }
}
