import 'package:flutter/material.dart';
import 'package:flutter_dev_test/features/auth/ui/login/login_page.dart';
import 'package:flutter_dev_test/features/auth/ui/recovery_secret/recovery_secret_page.dart';
import 'package:flutter_dev_test/features/home/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'recovery-secret',
          builder: (BuildContext context, GoRouterState state) {
            return const RecoverySecretPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) {
        return const HomePage();
      },
    )
  ],
);
