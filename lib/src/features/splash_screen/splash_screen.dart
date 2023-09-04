import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_firebase/src/features/splash_screen/splash_screen_controller.dart';
import 'package:learn_firebase/src/routing/app_routes.dart';
import 'package:learn_firebase/src/utils/extensions/state_extension.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    safeRebuild(() async {
      final controller = ref.read(splashControllerProvider.notifier);
      controller.startTime().whenComplete(() => context.goNamed(AppRoute.home));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('this is splash screen'),
      ),
    );
  }
}
