import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name.snakeCase()}}/cores/injection.dart';
import 'package:{{name.snakeCase()}}/cores/routes/routes.dart';
import 'package:{{name.snakeCase()}}/cores/services/secure_storage_service.dart';
import 'package:{{name.snakeCase()}}/common/presentation/pages/splash_page.dart';
import 'package:{{name.snakeCase()}}/features/login/presentation/pages/login_page.dart';
import 'package:{{name.snakeCase()}}/features/main/presentation/pages/main_page.dart';

class GorouterRouter {
  static final GlobalKey<NavigatorState> _authenticatedNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _mainNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    initialLocation: "/${Routes.initial}",
    debugLogDiagnostics: true,
    observers: [],
    routes: [
      GoRoute(
        name: Routes.initial,
        path: "/${Routes.initial}",
        builder: (_, state) => const SplashPage(),
      ),
      GoRoute(
        name: Routes.login,
        path: "/${Routes.login}",
        builder: (_, state) => const LoginPage(),
      ),
      ShellRoute(
        navigatorKey: _authenticatedNavigatorKey,
        redirect: (_, state) async {
          if (await sl.get<SecureStorageService>().accessToken == null) {
            return "/${Routes.login}";
          }

          return null;
        },
        builder: (_, state, child) => child,
        routes: [
          ShellRoute(
            navigatorKey: _mainNavigatorKey,
            pageBuilder: (_, state, child) => NoTransitionPage(
              child: MainPage(child: child),
            ),
            routes: [
              GoRoute(
                name: Routes.home,
                path: "/${Routes.home}",
                pageBuilder: (ctx, state) => const NoTransitionPage(
                  child: Scaffold(
                    body: Center(
                      child: Text("Home"),
                    ),
                  ),
                ),
              ),
              GoRoute(
                name: Routes.history,
                path: "/${Routes.history}",
                pageBuilder: (ctx, state) => const NoTransitionPage(
                  child: Scaffold(
                    body: Center(
                      child: Text("History"),
                    ),
                  ),
                ),
              ),
              GoRoute(
                name: Routes.notification,
                path: "/${Routes.notification}",
                pageBuilder: (ctx, state) => const NoTransitionPage(
                  child: Scaffold(
                    body: Center(
                      child: Text("Notification"),
                    ),
                  ),
                ),
              ),
              GoRoute(
                name: Routes.profile,
                path: "/${Routes.profile}",
                pageBuilder: (ctx, state) => const NoTransitionPage(
                  child: Scaffold(
                    body: Center(
                      child: Text("Profile"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
