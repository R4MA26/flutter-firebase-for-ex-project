import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
User? getCurrentUser(GetCurrentUserRef ref) {
  return FirebaseAuth.instance.currentUser;
}
