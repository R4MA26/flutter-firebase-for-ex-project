import 'package:go_router/go_router.dart';
import 'package:learn_firebase/src/features/home/home_screen.dart';
import 'package:learn_firebase/src/routing/app_routes.dart';

final homeRoutes = GoRoute(
  path: '/home',
  name: AppRoute.home,
  builder: (context, state) => const HomeScreen(),
);
