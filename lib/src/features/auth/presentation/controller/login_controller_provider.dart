import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_firebase/src/routing/app_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:learn_firebase/src/features/auth/application/auth_service.dart';

part 'login_controller_provider.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  Future<void> build() async {
    // return a value (or do nothing if the return type is void)
  }

  void signInWithGoogle(BuildContext context) async {
    final authService = ref.read(authServiceProvider);

    state = const AsyncLoading();

    final res = await authService.signInWithGoogle();

    res.when(
      success: (data) {
        context.goNamed(AppRoute.home);
      },
      failure: (error, stackTrace) {
        log('$error$stackTrace');
      },
    );

    // state = await AsyncValue.guard(authService.signInWithGoogle);
  }

  void signOut(BuildContext context) async {
    final authService = ref.read(authServiceProvider);

    state = const AsyncLoading();

    final res = await authService.signOut();

    res.when(
      success: (data) {
        context.goNamed(AppRoute.login);
      },
      failure: (error, stackTrace) {},
    );

    // state = await AsyncValue.guard(authService.signOut)
    //     .whenComplete(() => context.goNamed(AppRoute.login));
  }
}
