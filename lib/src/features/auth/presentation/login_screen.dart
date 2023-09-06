import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase/src/common_widgets/card_button_widget.dart';
import 'package:learn_firebase/src/features/auth/presentation/login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginControllerProvider.notifier);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CardButtonWidget(
                onTap: () async => controller.signInWithGmail(context),
                title: 'Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
