import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/login_bloc.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({
    super.key,
  });

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginSuccessState():
            context.go("/home");
            break;
          case LoginErrorState():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 5),
              ),
            );
            break;
          case LoginInvalidCredentialsState():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 5),
              ),
            );
            break;
          case LoginInvalidTOTPState():
            context.go("/recovery-secret");
            break;
          default:
            break;
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: TextFormField(
                controller: _userController,
                focusNode: _userFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  _passwordFocusNode.requestFocus();
                },
                decoration: const InputDecoration(
                  labelText: 'Usuário',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                onFieldSubmitted: (value) {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(
                          LoginRequestEvent(
                            username: _userController.text,
                            password: _passwordController.text,
                          ),
                        );
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return FilledButton(
                    onPressed: state is! LoginLoadingState
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                    LoginRequestEvent(
                                      username: _userController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          }
                        : null,
                    child: Center(
                      child: state is! LoginLoadingState
                          ? const Text("Entrar")
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
