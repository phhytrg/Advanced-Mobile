// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerGeneratorHash() => r'9fe8faf69da72cf85c2704fe1bb9acbcde8fd44f';

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

/// See also [routerGenerator].
@ProviderFor(routerGenerator)
const routerGeneratorProvider = RouterGeneratorFamily();

/// See also [routerGenerator].
class RouterGeneratorFamily extends Family<GoRouter> {
  /// See also [routerGenerator].
  const RouterGeneratorFamily();

  /// See also [routerGenerator].
  RouterGeneratorProvider call(
    AuthState authState,
  ) {
    return RouterGeneratorProvider(
      authState,
    );
  }

  @override
  RouterGeneratorProvider getProviderOverride(
    covariant RouterGeneratorProvider provider,
  ) {
    return call(
      provider.authState,
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
  String? get name => r'routerGeneratorProvider';
}

/// See also [routerGenerator].
class RouterGeneratorProvider extends Provider<GoRouter> {
  /// See also [routerGenerator].
  RouterGeneratorProvider(
    AuthState authState,
  ) : this._internal(
          (ref) => routerGenerator(
            ref as RouterGeneratorRef,
            authState,
          ),
          from: routerGeneratorProvider,
          name: r'routerGeneratorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routerGeneratorHash,
          dependencies: RouterGeneratorFamily._dependencies,
          allTransitiveDependencies:
              RouterGeneratorFamily._allTransitiveDependencies,
          authState: authState,
        );

  RouterGeneratorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authState,
  }) : super.internal();

  final AuthState authState;

  @override
  Override overrideWith(
    GoRouter Function(RouterGeneratorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RouterGeneratorProvider._internal(
        (ref) => create(ref as RouterGeneratorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authState: authState,
      ),
    );
  }

  @override
  ProviderElement<GoRouter> createElement() {
    return _RouterGeneratorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RouterGeneratorProvider && other.authState == authState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authState.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RouterGeneratorRef on ProviderRef<GoRouter> {
  /// The parameter `authState` of this provider.
  AuthState get authState;
}

class _RouterGeneratorProviderElement extends ProviderElement<GoRouter>
    with RouterGeneratorRef {
  _RouterGeneratorProviderElement(super.provider);

  @override
  AuthState get authState => (origin as RouterGeneratorProvider).authState;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
