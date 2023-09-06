import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_firebase/src/services/config/result.dart';

class AuthService {
  // Google Sign In
  Future<Result<UserCredential>> signInWithGoogle() async {
    late UserCredential userCredential;
    try {
      // Begin intacrtive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      // Obatin auth details from request
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
      // Create new credential for user
      if (gAuth?.accessToken != null && gAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: gAuth?.accessToken,
          idToken: gAuth?.idToken,
        );
        // Finally lets sign in
        userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
    return Result.success(userCredential);
  }

  Future<Result<void>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
    return const Result.success(null);
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});
