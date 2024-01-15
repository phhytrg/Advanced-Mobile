// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tutorViewmodelHash() => r'c622a4edafab1f548f2c6f89a645a7b48113880b';

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

abstract class _$TutorViewmodel
    extends BuildlessAutoDisposeAsyncNotifier<Tutor?> {
  late final String tutorId;

  FutureOr<Tutor?> build(
    String tutorId,
  );
}

/// See also [TutorViewmodel].
@ProviderFor(TutorViewmodel)
const tutorViewmodelProvider = TutorViewmodelFamily();

/// See also [TutorViewmodel].
class TutorViewmodelFamily extends Family<AsyncValue<Tutor?>> {
  /// See also [TutorViewmodel].
  const TutorViewmodelFamily();

  /// See also [TutorViewmodel].
  TutorViewmodelProvider call(
    String tutorId,
  ) {
    return TutorViewmodelProvider(
      tutorId,
    );
  }

  @override
  TutorViewmodelProvider getProviderOverride(
    covariant TutorViewmodelProvider provider,
  ) {
    return call(
      provider.tutorId,
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
  String? get name => r'tutorViewmodelProvider';
}

/// See also [TutorViewmodel].
class TutorViewmodelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TutorViewmodel, Tutor?> {
  /// See also [TutorViewmodel].
  TutorViewmodelProvider(
    String tutorId,
  ) : this._internal(
          () => TutorViewmodel()..tutorId = tutorId,
          from: tutorViewmodelProvider,
          name: r'tutorViewmodelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tutorViewmodelHash,
          dependencies: TutorViewmodelFamily._dependencies,
          allTransitiveDependencies:
              TutorViewmodelFamily._allTransitiveDependencies,
          tutorId: tutorId,
        );

  TutorViewmodelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tutorId,
  }) : super.internal();

  final String tutorId;

  @override
  FutureOr<Tutor?> runNotifierBuild(
    covariant TutorViewmodel notifier,
  ) {
    return notifier.build(
      tutorId,
    );
  }

  @override
  Override overrideWith(TutorViewmodel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TutorViewmodelProvider._internal(
        () => create()..tutorId = tutorId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tutorId: tutorId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TutorViewmodel, Tutor?>
      createElement() {
    return _TutorViewmodelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TutorViewmodelProvider && other.tutorId == tutorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tutorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TutorViewmodelRef on AutoDisposeAsyncNotifierProviderRef<Tutor?> {
  /// The parameter `tutorId` of this provider.
  String get tutorId;
}

class _TutorViewmodelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TutorViewmodel, Tutor?>
    with TutorViewmodelRef {
  _TutorViewmodelProviderElement(super.provider);

  @override
  String get tutorId => (origin as TutorViewmodelProvider).tutorId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
