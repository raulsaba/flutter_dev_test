import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/router/go_router.dart';
import 'package:flutter_dev_test/core/theme/app_theme_data.dart';

void main() {
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
