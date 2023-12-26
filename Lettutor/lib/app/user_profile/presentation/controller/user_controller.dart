

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/user_profile/domain/user.dart';
import 'package:lettutor/core/network/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/user_repository.dart';


part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  Future<User> build() async {
    final userRepository = ref.read(userRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => userRepository.getUserProfile());
    return state.valueOrNull!;
  }
}