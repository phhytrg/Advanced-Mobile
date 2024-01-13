// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_schedule_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selfScheduleRepositoryHash() =>
    r'69193a919b0ce979c919b737208bdb3dd884ad10';

/// See also [selfScheduleRepository].
@ProviderFor(selfScheduleRepository)
final selfScheduleRepositoryProvider =
    Provider<SelfScheduleRepository>.internal(
  selfScheduleRepository,
  name: r'selfScheduleRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selfScheduleRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SelfScheduleRepositoryRef = ProviderRef<SelfScheduleRepository>;
String _$feedbackTutorHash() => r'13572c21d28e467772aedaf47a528be0f1eb6cd8';

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

/// See also [feedbackTutor].
@ProviderFor(feedbackTutor)
const feedbackTutorProvider = FeedbackTutorFamily();

/// See also [feedbackTutor].
class FeedbackTutorFamily extends Family<AsyncValue<bool>> {
  /// See also [feedbackTutor].
  const FeedbackTutorFamily();

  /// See also [feedbackTutor].
  FeedbackTutorProvider call(
    String bookingId,
    String userId,
    String feedback,
    int rating,
  ) {
    return FeedbackTutorProvider(
      bookingId,
      userId,
      feedback,
      rating,
    );
  }

  @override
  FeedbackTutorProvider getProviderOverride(
    covariant FeedbackTutorProvider provider,
  ) {
    return call(
      provider.bookingId,
      provider.userId,
      provider.feedback,
      provider.rating,
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
  String? get name => r'feedbackTutorProvider';
}

/// See also [feedbackTutor].
class FeedbackTutorProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [feedbackTutor].
  FeedbackTutorProvider(
    String bookingId,
    String userId,
    String feedback,
    int rating,
  ) : this._internal(
          (ref) => feedbackTutor(
            ref as FeedbackTutorRef,
            bookingId,
            userId,
            feedback,
            rating,
          ),
          from: feedbackTutorProvider,
          name: r'feedbackTutorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackTutorHash,
          dependencies: FeedbackTutorFamily._dependencies,
          allTransitiveDependencies:
              FeedbackTutorFamily._allTransitiveDependencies,
          bookingId: bookingId,
          userId: userId,
          feedback: feedback,
          rating: rating,
        );

  FeedbackTutorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bookingId,
    required this.userId,
    required this.feedback,
    required this.rating,
  }) : super.internal();

  final String bookingId;
  final String userId;
  final String feedback;
  final int rating;

  @override
  Override overrideWith(
    FutureOr<bool> Function(FeedbackTutorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedbackTutorProvider._internal(
        (ref) => create(ref as FeedbackTutorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bookingId: bookingId,
        userId: userId,
        feedback: feedback,
        rating: rating,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _FeedbackTutorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackTutorProvider &&
        other.bookingId == bookingId &&
        other.userId == userId &&
        other.feedback == feedback &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookingId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, feedback.hashCode);
    hash = _SystemHash.combine(hash, rating.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbackTutorRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `bookingId` of this provider.
  String get bookingId;

  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `feedback` of this provider.
  String get feedback;

  /// The parameter `rating` of this provider.
  int get rating;
}

class _FeedbackTutorProviderElement
    extends AutoDisposeFutureProviderElement<bool> with FeedbackTutorRef {
  _FeedbackTutorProviderElement(super.provider);

  @override
  String get bookingId => (origin as FeedbackTutorProvider).bookingId;
  @override
  String get userId => (origin as FeedbackTutorProvider).userId;
  @override
  String get feedback => (origin as FeedbackTutorProvider).feedback;
  @override
  int get rating => (origin as FeedbackTutorProvider).rating;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
