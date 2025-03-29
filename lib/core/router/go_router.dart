import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/ui/login/login_container.dart';
import '../../features/auth/ui/recovery_secret/recovery_secret_container.dart';
import '../../features/home/home_page.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginContainer();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'recovery-secret',
          builder: (BuildContext context, GoRouterState state) {
            return const RecoverySecretContainer();
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
