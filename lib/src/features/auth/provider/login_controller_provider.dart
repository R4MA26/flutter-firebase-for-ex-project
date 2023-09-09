import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:learn_firebase/src/features/auth/service/auth_service.dart';
import 'package:learn_firebase/src/routing/app_routes.dart';

part 'login_controller_provider.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  Future<AuthService> build() async {
    return AuthService();
  }

  void signInWithGoogle(BuildContext context) async {
    state = const AsyncLoading();
    AuthService? authService = state.valueOrNull;
    if (authService != null) {
      final res = await authService.signInWithGoogle();

      res.when(
        success: (data) {
          context.goNamed(AppRoute.home);
        },
        failure: (error, stackTrace) {},
      );
    }
  }

  void signOut(BuildContext context) async {
    state = const AsyncLoading();

    AuthService? authService = state.valueOrNull;
    if (authService != null) {
      final res = await authService.signOut();

      res.when(
        success: (data) {
          context.goNamed(AppRoute.login);
        },
        failure: (error, stackTrace) {},
      );
    }
  }
}
