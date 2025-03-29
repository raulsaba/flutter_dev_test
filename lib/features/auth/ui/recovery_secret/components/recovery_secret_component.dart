import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:verification_code_field/verification_code_field.dart';

import '../bloc/recovery_secret_bloc.dart';

class RecoverySecretyComponent extends StatefulWidget {
  const RecoverySecretyComponent({
    super.key,
  });

  @override
  State<RecoverySecretyComponent> createState() => _RecoverySecretyComponentState();
}

class _RecoverySecretyComponentState extends State<RecoverySecretyComponent> {
  String code = "";
  @override
  Widget build(BuildContext context) {
    return BlocListener<RecoverySecretBloc, RecoverySecretState>(
      listener: (context, state) {
        switch (state) {
          case RecoverySecretSuccessState():
            context.pop();
            break;
          case RecoverySecretErrorState():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 5),
              ),
            );
            break;
          case RecoverySecretUserNotFoundState():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 5),
              ),
            );
            break;
          case RecoverySecretInvalidPasswordState():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 5),
              ),
            );
            break;
          case RecoverySecretInvalidCodeState():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 5),
              ),
            );
            break;
          default:
        }
      },
      child: Column(
        children: [
          Center(
            child: VerificationCodeField(
              codeDigit: CodeDigit.six,
              textStyle: Theme.of(context).textTheme.titleSmall,
              onChanged: (value) {
                if (code != "" && value.length < 6) {
                  setState(() {
                    code = "";
                  });
                }
              },
              onSubmit: (value) {
                setState(() {
                  code = value;
                });
              },
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<RecoverySecretBloc, RecoverySecretState>(
              builder: (context, state) {
                return FilledButton(
                  onPressed: () {
                    if (code.length == 6) {
                      context.read<RecoverySecretBloc>().add(RecoverySecretRequestEvent(code: code));
                    }
                  },
                  child: const Text("Confirmar"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
