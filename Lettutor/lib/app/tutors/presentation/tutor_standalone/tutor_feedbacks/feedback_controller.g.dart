// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedbacksControllerHash() =>
    r'8e20f49915e2c1d3403e7777d4a8ab1bed084b09';

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
  late final int page;
  late final int perPage;

  FutureOr<FeedbackList?> build(
    String tutorId,
    int page,
    int perPage,
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
    int page,
    int perPage,
  ) {
    return FeedbacksControllerProvider(
      tutorId,
      page,
      perPage,
    );
  }

  @override
  FeedbacksControllerProvider getProviderOverride(
    covariant FeedbacksControllerProvider provider,
  ) {
    return call(
      provider.tutorId,
      provider.page,
      provider.perPage,
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
    int page,
    int perPage,
  ) : this._internal(
          () => FeedbacksController()
            ..tutorId = tutorId
            ..page = page
            ..perPage = perPage,
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
          page: page,
          perPage: perPage,
        );

  FeedbacksControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tutorId,
    required this.page,
    required this.perPage,
  }) : super.internal();

  final String tutorId;
  final int page;
  final int perPage;

  @override
  FutureOr<FeedbackList?> runNotifierBuild(
    covariant FeedbacksController notifier,
  ) {
    return notifier.build(
      tutorId,
      page,
      perPage,
    );
  }

  @override
  Override overrideWith(FeedbacksController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedbacksControllerProvider._internal(
        () => create()
          ..tutorId = tutorId
          ..page = page
          ..perPage = perPage,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tutorId: tutorId,
        page: page,
        perPage: perPage,
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
    return other is FeedbacksControllerProvider &&
        other.tutorId == tutorId &&
        other.page == page &&
        other.perPage == perPage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tutorId.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbacksControllerRef
    on AutoDisposeAsyncNotifierProviderRef<FeedbackList?> {
  /// The parameter `tutorId` of this provider.
  String get tutorId;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `perPage` of this provider.
  int get perPage;
}

class _FeedbacksControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FeedbacksController,
        FeedbackList?> with FeedbacksControllerRef {
  _FeedbacksControllerProviderElement(super.provider);

  @override
  String get tutorId => (origin as FeedbacksControllerProvider).tutorId;
  @override
  int get page => (origin as FeedbacksControllerProvider).page;
  @override
  int get perPage => (origin as FeedbacksControllerProvider).perPage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
