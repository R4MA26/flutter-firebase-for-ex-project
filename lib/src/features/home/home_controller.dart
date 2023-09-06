import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<void> {
  HomeController() : super(null);

  User? get getCurrentUser => FirebaseAuth.instance.currentUser;
}

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, void>((ref) {
  return HomeController();
});
