// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokenRepositoryHash() => r'e2585bc080fd3156b336e2e32ee6c6322c5a362c';

/// See also [tokenRepository].
@ProviderFor(tokenRepository)
final tokenRepositoryProvider = Provider<TokenRepository>.internal(
  tokenRepository,
  name: r'tokenRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TokenRepositoryRef = ProviderRef<TokenRepository>;
String _$accessTokenHash() => r'4099f790871fa2c3f80939404c2d4ef9e6eb3721';

/// See also [accessToken].
@ProviderFor(accessToken)
final accessTokenProvider = FutureProvider<String?>.internal(
  accessToken,
  name: r'accessTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$accessTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccessTokenRef = FutureProviderRef<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
