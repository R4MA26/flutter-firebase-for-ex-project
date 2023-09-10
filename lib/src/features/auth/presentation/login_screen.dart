import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase/src/common_widgets/card_button_widget.dart';
import 'package:learn_firebase/src/features/auth/presentation/provider/login_controller_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginControllerProvider.notifier);
    final state = ref.watch(loginControllerProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CardButtonWidget(
                onTap: () async => controller.signInWithGoogle(context),
                title: 'Google',
                isLoading: state.isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
