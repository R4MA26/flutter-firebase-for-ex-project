// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginControllerHash() => r'87fe15278f7ca733c81239023c55716b618d6be1';

/// See also [LoginController].
@ProviderFor(LoginController)
final loginControllerProvider =
    AutoDisposeAsyncNotifierProvider<LoginController, AuthService>.internal(
  LoginController.new,
  name: r'loginControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginController = AutoDisposeAsyncNotifier<AuthService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member