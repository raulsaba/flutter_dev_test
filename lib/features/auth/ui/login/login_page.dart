import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/login_component.dart';
import 'resources/login_page_assets.dart';

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
            const Spacer(
              flex: 1,
            ),
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
            const LoginComponent(),
            const Spacer(
              flex: 2,
            ),
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
