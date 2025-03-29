import 'package:flutter/material.dart';
import 'core/get_it/get_it_config.dart';
import 'core/router/go_router.dart';
import 'core/theme/app_theme_data.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dev Flutter Test',
      theme: AppThemeData.lightTheme,
      routerConfig: goRouter,
    );
  }
}
