import 'package:flutter/material.dart';

class RecoverySecretPage extends StatelessWidget {
  const RecoverySecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
