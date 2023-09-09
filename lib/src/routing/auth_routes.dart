import 'package:go_router/go_router.dart';
import 'package:learn_firebase/src/features/auth/presentation/login_screen.dart';
import 'package:learn_firebase/src/routing/app_routes.dart';

final authRoutes = GoRoute(
  path: '/login',
  name: AppRoute.login,
  builder: (context, state) => const LoginScreen(),
);
