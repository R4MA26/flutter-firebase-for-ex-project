import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase/src/services/api/auth_api.dart';
import 'package:learn_firebase/src/services/config/result.dart';

class AuthRepository {
  final AuthApi _authApi;
  const AuthRepository(
    this._authApi,
  );

  Future<Result<UserCredential>> signInWithGoogle() async {
    return _authApi.signInWithGoogle();
  }

  Future<Result<void>> signOut() async {
    return _authApi.signOut();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authApi = ref.read(authApiProvider);

  return AuthRepository(authApi);
});
