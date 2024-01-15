

import 'package:lettutor/app/auth/data/local_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_controller.g.dart';

@Riverpod(keepAlive: true)
class TokenController extends _$TokenController {

  @override
  FutureOr<String?> build() async {
    final localAuthRepository = ref.read(localAuthRepositoryProvider);
    return await localAuthRepository.getAccessToken();
  }
}