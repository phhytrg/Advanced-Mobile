// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseRepositoryHash() => r'90b93b07ef3c7549dd289c80346eba7bc0f12f95';

/// See also [courseRepository].
@ProviderFor(courseRepository)
final courseRepositoryProvider = Provider<CourseRepository>.internal(
  courseRepository,
  name: r'courseRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$courseRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CourseRepositoryRef = ProviderRef<CourseRepository>;
String _$getCategoriesHash() => r'f755bb5ff7ec03781d719abc9f81320f72bd95d3';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider =
    AutoDisposeFutureProvider<List<Category>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = AutoDisposeFutureProviderRef<List<Category>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
