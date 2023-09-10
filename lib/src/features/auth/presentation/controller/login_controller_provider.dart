import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_firebase/src/features/auth/data/auth_repository.dart';
import 'package:learn_firebase/src/features/auth/presentation/controller/login_state.dart';
import 'package:learn_firebase/src/routing/app_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:learn_firebase/src/features/auth/application/auth_service.dart';

part 'login_controller_provider.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  Future<LoginState> build() async {
    return LoginState(
      authService: AuthService(
        ref.read(authRepositoryProvider),
      ),
    );
  }

  void signInWithGoogle(BuildContext context) async {
    state = const AsyncLoading();

    AuthService? authService = state.valueOrNull?.authService;

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

    AuthService? authService = state.valueOrNull?.authService;
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
