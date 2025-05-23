import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'components/recovery_secret_component.dart';
import 'resources/recovery_secret_page_assets.dart';

class RecoverySecretPage extends StatelessWidget {
  const RecoverySecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.keyboard_arrow_left), onPressed: () => Navigator.of(context).pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verificação",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              "Insira o código que foi enviado:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 64),
            const RecoverySecretyComponent(),
            const SizedBox(height: 32),
            Center(
              child: TextButton(
                onPressed: () => context.go("/home"),
                child: SizedBox(
                  width: 155,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          RecoverySecretPageAssets.messageQuestionIcon,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Não recebi o código",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
