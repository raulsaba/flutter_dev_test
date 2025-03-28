import 'package:flutter/material.dart';
import 'package:flutter_dev_test/features/auth/ui/login/resources/login_page_assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    LoginPageAssets.vector01,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                    // height: 120,
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    LoginPageAssets.vector02,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Center(
                  child: Image.asset(
                    LoginPageAssets.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Usuário',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FilledButton(
                onPressed: () {
                  context.go("/recovery-secret");
                },
                child: const Center(
                  child: Text("Entrar"),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("Esqueci a senha"),
            ),
          ],
        ),
      ),
    );
  }
}
