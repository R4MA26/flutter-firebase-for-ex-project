import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_firebase/src/services/config/result.dart';

class AuthApi {
  Future<Result<UserCredential>> signInWithGoogle() async {
    try {
      // Begin intacrtive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      // Obatin auth details from request
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
      // Create new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );
      // Finally lets sign in

      final response =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return Result.success(response);
    } on FirebaseAuthException catch (e, st) {
      return Result.failure(e, st);
    }
  }

  Future<Result<void>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e, st) {
      return Result.failure(e, st);
    }
    return const Result.success(null);
  }
}

final authApiProvider = Provider<AuthApi>((ref) {
  return AuthApi();
});
