// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_schedule_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tutorScheduleControllerHash() =>
    r'17d468630f233147c3de2baed044f655eb871876';

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

abstract class _$TutorScheduleController
    extends BuildlessAutoDisposeAsyncNotifier<List<ScheduleOfTutor>?> {
  late final String tutorId;
  late final int page;

  FutureOr<List<ScheduleOfTutor>?> build(
    String tutorId,
    int page,
  );
}

/// See also [TutorScheduleController].
@ProviderFor(TutorScheduleController)
const tutorScheduleControllerProvider = TutorScheduleControllerFamily();

/// See also [TutorScheduleController].
class TutorScheduleControllerFamily
    extends Family<AsyncValue<List<ScheduleOfTutor>?>> {
  /// See also [TutorScheduleController].
  const TutorScheduleControllerFamily();

  /// See also [TutorScheduleController].
  TutorScheduleControllerProvider call(
    String tutorId,
    int page,
  ) {
    return TutorScheduleControllerProvider(
      tutorId,
      page,
    );
  }

  @override
  TutorScheduleControllerProvider getProviderOverride(
    covariant TutorScheduleControllerProvider provider,
  ) {
    return call(
      provider.tutorId,
      provider.page,
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
  String? get name => r'tutorScheduleControllerProvider';
}

/// See also [TutorScheduleController].
class TutorScheduleControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TutorScheduleController,
        List<ScheduleOfTutor>?> {
  /// See also [TutorScheduleController].
  TutorScheduleControllerProvider(
    String tutorId,
    int page,
  ) : this._internal(
          () => TutorScheduleController()
            ..tutorId = tutorId
            ..page = page,
          from: tutorScheduleControllerProvider,
          name: r'tutorScheduleControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tutorScheduleControllerHash,
          dependencies: TutorScheduleControllerFamily._dependencies,
          allTransitiveDependencies:
              TutorScheduleControllerFamily._allTransitiveDependencies,
          tutorId: tutorId,
          page: page,
        );

  TutorScheduleControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tutorId,
    required this.page,
  }) : super.internal();

  final String tutorId;
  final int page;

  @override
  FutureOr<List<ScheduleOfTutor>?> runNotifierBuild(
    covariant TutorScheduleController notifier,
  ) {
    return notifier.build(
      tutorId,
      page,
    );
  }

  @override
  Override overrideWith(TutorScheduleController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TutorScheduleControllerProvider._internal(
        () => create()
          ..tutorId = tutorId
          ..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tutorId: tutorId,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TutorScheduleController,
      List<ScheduleOfTutor>?> createElement() {
    return _TutorScheduleControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TutorScheduleControllerProvider &&
        other.tutorId == tutorId &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tutorId.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TutorScheduleControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<ScheduleOfTutor>?> {
  /// The parameter `tutorId` of this provider.
  String get tutorId;

  /// The parameter `page` of this provider.
  int get page;
}

class _TutorScheduleControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TutorScheduleController,
        List<ScheduleOfTutor>?> with TutorScheduleControllerRef {
  _TutorScheduleControllerProviderElement(super.provider);

  @override
  String get tutorId => (origin as TutorScheduleControllerProvider).tutorId;
  @override
  int get page => (origin as TutorScheduleControllerProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
