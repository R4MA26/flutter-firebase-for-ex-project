import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_firebase/src/features/home/home.dart';
import 'package:learn_firebase/src/features/splash_screen/splash_screen.dart';

class AppRoute {
  static String home = 'home';
  static String splash = 'splash';
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routerNeglect: true,
    routes: [
      GoRoute(
        path: '/splash',
        name: AppRoute.splash,
        builder: (context, state) => const SplashScreen(),
        routes: [
          homeRoutes,
        ],
      ),
    ],
  );
});

final homeRoutes = GoRoute(
  path: 'home',
  name: AppRoute.home,
  builder: (context, state) => const MyHomePage(title: 'title'),
);
