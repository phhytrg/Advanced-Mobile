// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tutorRepositoryHash() => r'd0ede8b1aa3246d71825d0d838416f6fa460523d';

/// See also [tutorRepository].
@ProviderFor(tutorRepository)
final tutorRepositoryProvider = Provider<TutorRepository>.internal(
  tutorRepository,
  name: r'tutorRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tutorRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TutorRepositoryRef = ProviderRef<TutorRepository>;
String _$reportTutorHash() => r'fc04577ae3a34ce6eee1c954e142867ff81ae945';

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

/// See also [reportTutor].
@ProviderFor(reportTutor)
const reportTutorProvider = ReportTutorFamily();

/// See also [reportTutor].
class ReportTutorFamily extends Family<AsyncValue<bool>> {
  /// See also [reportTutor].
  const ReportTutorFamily();

  /// See also [reportTutor].
  ReportTutorProvider call(
    String id,
    String reason,
  ) {
    return ReportTutorProvider(
      id,
      reason,
    );
  }

  @override
  ReportTutorProvider getProviderOverride(
    covariant ReportTutorProvider provider,
  ) {
    return call(
      provider.id,
      provider.reason,
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
  String? get name => r'reportTutorProvider';
}

/// See also [reportTutor].
class ReportTutorProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [reportTutor].
  ReportTutorProvider(
    String id,
    String reason,
  ) : this._internal(
          (ref) => reportTutor(
            ref as ReportTutorRef,
            id,
            reason,
          ),
          from: reportTutorProvider,
          name: r'reportTutorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportTutorHash,
          dependencies: ReportTutorFamily._dependencies,
          allTransitiveDependencies:
              ReportTutorFamily._allTransitiveDependencies,
          id: id,
          reason: reason,
        );

  ReportTutorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.reason,
  }) : super.internal();

  final String id;
  final String reason;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ReportTutorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReportTutorProvider._internal(
        (ref) => create(ref as ReportTutorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        reason: reason,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ReportTutorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportTutorProvider &&
        other.id == id &&
        other.reason == reason;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, reason.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReportTutorRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `reason` of this provider.
  String get reason;
}

class _ReportTutorProviderElement extends AutoDisposeFutureProviderElement<bool>
    with ReportTutorRef {
  _ReportTutorProviderElement(super.provider);

  @override
  String get id => (origin as ReportTutorProvider).id;
  @override
  String get reason => (origin as ReportTutorProvider).reason;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
