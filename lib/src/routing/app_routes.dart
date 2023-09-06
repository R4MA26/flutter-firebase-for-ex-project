import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_firebase/src/features/home/home_screen.dart';
import 'package:learn_firebase/src/features/splash_screen/splash_screen.dart';
import 'package:learn_firebase/src/routing/auth_routes.dart';

class AppRoute {
  static String home = 'home';
  static String splash = 'splash';
  static String login = 'login';
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routerNeglect: true,
    redirect: (context, state) {
      final currentUser = FirebaseAuth.instance.currentUser;
      final matchedLocation = state.matchedLocation;
      if (matchedLocation == '/') return null;

      if (currentUser != null) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splash,
        builder: (context, state) => const SplashScreen(),
        routes: [
          authRoutes,
          homeRoutes,
        ],
      ),
    ],
  );
});

final homeRoutes = GoRoute(
  path: 'home',
  name: AppRoute.home,
  builder: (context, state) => const HomeScreen(),
);
