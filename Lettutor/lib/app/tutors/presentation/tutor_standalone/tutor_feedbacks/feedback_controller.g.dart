// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedbacksControllerHash() =>
    r'722d40ff54163f00875ee4b6d3b38c7186723ae2';

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

abstract class _$FeedbacksController
    extends BuildlessAutoDisposeAsyncNotifier<FeedbackList?> {
  late final String tutorId;

  FutureOr<FeedbackList?> build(
    String tutorId,
  );
}

/// See also [FeedbacksController].
@ProviderFor(FeedbacksController)
const feedbacksControllerProvider = FeedbacksControllerFamily();

/// See also [FeedbacksController].
class FeedbacksControllerFamily extends Family<AsyncValue<FeedbackList?>> {
  /// See also [FeedbacksController].
  const FeedbacksControllerFamily();

  /// See also [FeedbacksController].
  FeedbacksControllerProvider call(
    String tutorId,
  ) {
    return FeedbacksControllerProvider(
      tutorId,
    );
  }

  @override
  FeedbacksControllerProvider getProviderOverride(
    covariant FeedbacksControllerProvider provider,
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
  String? get name => r'feedbacksControllerProvider';
}

/// See also [FeedbacksController].
class FeedbacksControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FeedbacksController, FeedbackList?> {
  /// See also [FeedbacksController].
  FeedbacksControllerProvider(
    String tutorId,
  ) : this._internal(
          () => FeedbacksController()..tutorId = tutorId,
          from: feedbacksControllerProvider,
          name: r'feedbacksControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbacksControllerHash,
          dependencies: FeedbacksControllerFamily._dependencies,
          allTransitiveDependencies:
              FeedbacksControllerFamily._allTransitiveDependencies,
          tutorId: tutorId,
        );

  FeedbacksControllerProvider._internal(
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
  FutureOr<FeedbackList?> runNotifierBuild(
    covariant FeedbacksController notifier,
  ) {
    return notifier.build(
      tutorId,
    );
  }

  @override
  Override overrideWith(FeedbacksController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedbacksControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FeedbacksController, FeedbackList?>
      createElement() {
    return _FeedbacksControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbacksControllerProvider && other.tutorId == tutorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tutorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbacksControllerRef
    on AutoDisposeAsyncNotifierProviderRef<FeedbackList?> {
  /// The parameter `tutorId` of this provider.
  String get tutorId;
}

class _FeedbacksControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FeedbacksController,
        FeedbackList?> with FeedbacksControllerRef {
  _FeedbacksControllerProviderElement(super.provider);

  @override
  String get tutorId => (origin as FeedbacksControllerProvider).tutorId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
