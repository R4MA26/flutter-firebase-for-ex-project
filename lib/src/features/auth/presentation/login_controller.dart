import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_firebase/src/features/auth/service/auth_service.dart';
import 'package:learn_firebase/src/routing/app_routes.dart';

class LoginController extends StateNotifier<void> {
  LoginController({required this.authService}) : super(null);

  final AuthService authService;

  User? get getCurrentUser => FirebaseAuth.instance.currentUser;

  void signInWithGmail(BuildContext context) async {
    final result = await authService.signInWithGoogle();

    result.when(
      success: (data) {
        context.goNamed(AppRoute.home);
      },
      failure: (error, stackTrace) {},
    );
  }

  void signOut(BuildContext context) async {
    final result = await authService.signOut();

    result.when(
      success: (data) {
        context.goNamed(AppRoute.login);
      },
      failure: (error, stackTrace) {},
    );
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, void>((ref) {
  return LoginController(authService: ref.read(authServiceProvider));
});
