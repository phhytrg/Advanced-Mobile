// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'4ecda37b02371345eb0420a7eb606bb8e763163d';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = ProviderRef<AuthRepository>;
String _$signupHash() => r'7e449a813d5ce836eb13748f408d8faa799416f5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [signup].
@ProviderFor(signup)
const signupProvider = SignupFamily();

/// See also [signup].
class SignupFamily extends Family<AsyncValue<bool>> {
  /// See also [signup].
  const SignupFamily();

  /// See also [signup].
  SignupProvider call(
    String email,
    String password,
  ) {
    return SignupProvider(
      email,
      password,
    );
  }

  @override
  SignupProvider getProviderOverride(
    covariant SignupProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signupProvider';
}

/// See also [signup].
class SignupProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [signup].
  SignupProvider(
    String email,
    String password,
  ) : this._internal(
          (ref) => signup(
            ref as SignupRef,
            email,
            password,
          ),
          from: signupProvider,
          name: r'signupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signupHash,
          dependencies: SignupFamily._dependencies,
          allTransitiveDependencies: SignupFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  SignupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SignupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignupProvider._internal(
        (ref) => create(ref as SignupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SignupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignupProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignupRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignupProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SignupRef {
  _SignupProviderElement(super.provider);

  @override
  String get email => (origin as SignupProvider).email;
  @override
  String get password => (origin as SignupProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
