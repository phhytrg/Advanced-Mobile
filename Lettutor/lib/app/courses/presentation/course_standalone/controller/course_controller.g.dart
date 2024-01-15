// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseControllerHash() => r'21cbac552677a40d95e1a16fcd46fd1fefe717f1';

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

abstract class _$CourseController
    extends BuildlessAutoDisposeAsyncNotifier<Course?> {
  late final String id;

  FutureOr<Course?> build(
    String id,
  );
}

/// See also [CourseController].
@ProviderFor(CourseController)
const courseControllerProvider = CourseControllerFamily();

/// See also [CourseController].
class CourseControllerFamily extends Family<AsyncValue<Course?>> {
  /// See also [CourseController].
  const CourseControllerFamily();

  /// See also [CourseController].
  CourseControllerProvider call(
    String id,
  ) {
    return CourseControllerProvider(
      id,
    );
  }

  @override
  CourseControllerProvider getProviderOverride(
    covariant CourseControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'courseControllerProvider';
}

/// See also [CourseController].
class CourseControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CourseController, Course?> {
  /// See also [CourseController].
  CourseControllerProvider(
    String id,
  ) : this._internal(
          () => CourseController()..id = id,
          from: courseControllerProvider,
          name: r'courseControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseControllerHash,
          dependencies: CourseControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseControllerFamily._allTransitiveDependencies,
          id: id,
        );

  CourseControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<Course?> runNotifierBuild(
    covariant CourseController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(CourseController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CourseControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CourseController, Course?>
      createElement() {
    return _CourseControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CourseControllerRef on AutoDisposeAsyncNotifierProviderRef<Course?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CourseControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CourseController, Course?>
    with CourseControllerRef {
  _CourseControllerProviderElement(super.provider);

  @override
  String get id => (origin as CourseControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
