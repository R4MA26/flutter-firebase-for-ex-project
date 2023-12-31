import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase/src/common_widgets/card_button_widget.dart';
import 'package:learn_firebase/src/features/auth/presentation/controller/login_controller_provider.dart';
import 'package:learn_firebase/src/features/home/controller/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerLogin = ref.read(loginControllerProvider.notifier);
    final user = ref.watch(getCurrentUserProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(user!.photoURL.toString()),
            ),
            Text('${user.displayName}'),
            Text('${user.email}'),
            CardButtonWidget(
              title: 'Logout',
              onTap: () {
                controllerLogin.signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
