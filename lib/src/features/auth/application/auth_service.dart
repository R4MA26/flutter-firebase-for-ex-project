import 'package:learn_firebase/src/features/auth/data/auth_repository.dart';
import 'package:learn_firebase/src/services/config/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthService {
  final AuthRepository _authRepository;
  const AuthService(
    this._authRepository,
  );

  Future<Result<void>> signInWithGoogle() async {
    return _authRepository.signInWithGoogle();
  }

  Future<Result<void>> signOut() async {
    return _authRepository.signOut();
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final authRepository = ref.read(authRepositoryProvider);

  return AuthService(authRepository);
});
