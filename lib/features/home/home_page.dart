import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            context.go("/");
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
